import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_snack_bar.dart';
import 'package:crave/features/calories_store/data/models/calories_store_request.dart';
import 'package:crave/features/calories_store/presentation/cubit/calories_store_cubit.dart';
import 'package:crave/features/calories_store/presentation/widgets/activity_selector.dart';
import 'package:crave/features/calories_store/presentation/widgets/calorie_result_dialog.dart';
import 'package:crave/features/calories_store/presentation/widgets/gender_selector.dart';
import 'package:crave/features/calories_store/presentation/widgets/goal_selector.dart';
import 'package:crave/features/calories_store/presentation/widgets/height_input.dart';
import 'package:crave/features/calories_store/presentation/widgets/weight_picker.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaloriesStoreViewBody extends StatefulWidget {
  const CaloriesStoreViewBody({super.key});

  @override
  State<CaloriesStoreViewBody> createState() => _CaloriesStoreViewBodyState();
}

class _CaloriesStoreViewBodyState extends State<CaloriesStoreViewBody>
    with TickerProviderStateMixin {
  String _selectedGender = '';
  int _selectedHeight = 170;
  int _selectedWeight = 70;
  String _selectedActivity = '';
  String _selectedGoal = '';
  final TextEditingController _ageController = TextEditingController();

  int _currentStep = 0;

  late List<AnimationController> _animControllers;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _ageController.addListener(_onAgeChanged);
    _initAnimations();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _animControllers[0].forward();
    });
  }

  void _initAnimations() {
    _animControllers = List.generate(7, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      );
    });

    _fadeAnimations = _animControllers.map((controller) {
      return CurvedAnimation(parent: controller, curve: Curves.easeOut);
    }).toList();

    _slideAnimations = _animControllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    }).toList();
  }

  void _revealNextStep(int stepToReveal) {
    if (stepToReveal > _currentStep) {
      setState(() => _currentStep = stepToReveal);
      _animControllers[stepToReveal].forward();
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted && _scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  void _onAgeChanged() {
    setState(() {});
    if (_ageController.text.trim().isNotEmpty && _currentStep < 2) {
      _revealNextStep(2);
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _scrollController.dispose();
    for (final controller in _animControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onCalculate() {
    final request = CaloriesStoreRequest(
      age: _ageController.text.trim(),
      gender: _selectedGender,
      tall: _selectedHeight.toString(),
      weight: _selectedWeight.toString(),
      activity: _selectedActivity,
      goal: _selectedGoal,
    );

    context.read<CaloriesStoreCubit>().calculateCalories(params: request);
  }

  void _showResultDialog(num calories) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => CalorieResultDialog(
        calories: calories,
        onSetPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildAnimatedItem(int index, Widget child) {
    if (index > _currentStep) return const SizedBox.shrink();
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: SlideTransition(position: _slideAnimations[index], child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CaloriesStoreCubit, CaloriesStoreState>(
      listener: (context, state) {
        if (state is CaloriesStoreSuccess) {
          _showResultDialog(state.calories);
        } else if (state is CaloriesStoreError) {
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    _buildAnimatedItem(
                      0,
                      GenderSelector(
                        selectedGender: _selectedGender,
                        onGenderChanged: (gender) {
                          setState(() => _selectedGender = gender);
                          _revealNextStep(1);
                        },
                      ),
                    ),
                    if (_currentStep >= 1) SizedBox(height: 32.h),
                    _buildAnimatedItem(1, _buildAgeInput()),
                    if (_currentStep >= 2) SizedBox(height: 32.h),
                    _buildAnimatedItem(
                      2,
                      HeightInput(
                        heightInCm: _selectedHeight,
                        onHeightChanged: (value) {
                          setState(() => _selectedHeight = value);
                          _revealNextStep(3);
                        },
                      ),
                    ),
                    if (_currentStep >= 3) SizedBox(height: 32.h),
                    _buildAnimatedItem(
                      3,
                      WeightPicker(
                        selectedWeight: _selectedWeight,
                        onWeightChanged: (weight) {
                          setState(() => _selectedWeight = weight);
                          _revealNextStep(4);
                        },
                      ),
                    ),
                    if (_currentStep >= 4) SizedBox(height: 32.h),
                    _buildAnimatedItem(
                      4,
                      ActivitySelector(
                        selectedActivity: _selectedActivity,
                        onActivityChanged: (activity) {
                          setState(() => _selectedActivity = activity);
                          _revealNextStep(5);
                        },
                      ),
                    ),
                    if (_currentStep >= 5) SizedBox(height: 32.h),
                    _buildAnimatedItem(
                      5,
                      GoalSelector(
                        selectedGoal: _selectedGoal,
                        onGoalChanged: (goal) {
                          setState(() => _selectedGoal = goal);
                          _revealNextStep(6);
                        },
                      ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(8.w),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.white,
                size: 20.sp,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                Icons.calculate_outlined,
                color: AppColors.white,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'Calorie calculator',
                style: AppStyles.textSemiBold18.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(width: 36.w),
        ],
      ),
    );
  }

  Widget _buildAgeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How old are you ?',
          style: AppStyles.textRegular16.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 16.h),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            style: AppStyles.textMedium18.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your age',
              hintStyle: AppStyles.textRegular16.copyWith(
                color: AppColors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    if (_currentStep < 6) return const SizedBox.shrink();
    return FadeTransition(
      opacity: _fadeAnimations[6],
      child: SlideTransition(
        position: _slideAnimations[6],
        child: BlocBuilder<CaloriesStoreCubit, CaloriesStoreState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: CustomButton(
                title: 'CALCULATE CALORIE',
                isLoading: state is CaloriesStoreLoading,
                backgroundColor: AppColors.red,
                onTap: state is CaloriesStoreLoading ? null : _onCalculate,
              ),
            );
          },
        ),
      ),
    );
  }
}
