import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/features/tables/presentation/cubit/tables_cubit.dart';
import 'package:crave/features/tables/presentation/widgets/date_selector.dart';
import 'package:crave/features/tables/presentation/widgets/people_selector.dart';
import 'package:crave/features/tables/presentation/widgets/reservation_header.dart';
import 'package:crave/features/tables/presentation/views/table_selection_view.dart';
import 'package:crave/features/tables/presentation/widgets/time_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationFormScreen extends StatefulWidget {
  const ReservationFormScreen({super.key});

  @override
  State<ReservationFormScreen> createState() => _ReservationFormScreenState();
}

class _ReservationFormScreenState extends State<ReservationFormScreen> {
  DateTime? _selectedDate;
  String? _selectedTime;
  int? _selectedNumberOfPeople;

  @override
  Widget build(BuildContext context) {
    final userName = Prefs.getUser()?.name ?? 'Guest';

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/table.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.black.withValues(alpha: 0.7),
              AppColors.black.withValues(alpha: 0.9),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                ReservationHeader(userName: userName),
                const Spacer(),
                DateSelector(
                  selectedDate: _selectedDate,
                  onDateChanged: (date) => setState(() => _selectedDate = date),
                ),
                SizedBox(height: 32.h),
                TimeSelector(
                  selectedTime: _selectedTime,
                  onTimeChanged: (time) => setState(() => _selectedTime = time),
                ),
                SizedBox(height: 32.h),
                PeopleSelector(
                  selectedNumber: _selectedNumberOfPeople,
                  onNumberChanged: (number) =>
                      setState(() => _selectedNumberOfPeople = number),
                ),
                SizedBox(height: 40.h),
                CustomButton(
                  title: 'NEXT',
                  backgroundColor: AppColors.red,
                  onTap: _selectedDate != null &&
                          _selectedTime != null &&
                          _selectedNumberOfPeople != null
                      ? () {
                          final cubit = context.read<TablesCubit>();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: cubit,
                                child: TableSelectionView(
                                  date: _selectedDate!,
                                  time: _selectedTime!,
                                  numberOfPeople: _selectedNumberOfPeople!,
                                ),
                              ),
                            ),
                          );
                        }
                      : null,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
