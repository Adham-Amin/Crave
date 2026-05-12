import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_snack_bar.dart';
import 'package:crave/features/tables/data/models/table_model.dart';
import 'package:crave/features/tables/data/models/tables_request.dart';
import 'package:crave/features/tables/presentation/cubit/tables_cubit.dart';
import 'package:crave/features/tables/presentation/widgets/reservation_details_list.dart';
import 'package:crave/core/widgets/success_dialog.dart';
import 'package:crave/features/tables/presentation/widgets/table_visualization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmationViewBody extends StatelessWidget {
  const ConfirmationViewBody({
    super.key,
    required this.date,
    required this.time,
    required this.numberOfPeople,
    required this.table,
  });

  final DateTime date;
  final String time;
  final int numberOfPeople;
  final TableModel table;

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  void _confirmReservation(BuildContext context) {
    final request = TablesRequest(
      number: table.number.toString(),
      numberPeople: numberOfPeople.toString(),
      date: _formatDate(date),
      time: time,
    );

    context.read<TablesCubit>().storeTable(table: request);
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (context) => SuccessDialog(message: 'Your reservation has been confirmed!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TablesCubit, TablesState>(
      listener: (context, state) {
        if (state is TablesLoaded) {
          _showSuccessDialog(context);
        } else if (state is TablesError) {
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: SafeArea(
        child: Container(
          color: AppColors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: GestureDetector(
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
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Confirm Reservation',
                  style: AppStyles.textBold24.copyWith(
                    color: AppColors.white,
                    fontSize: 28.sp,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      ReservationDetailsList(
                        date: _formatDate(date),
                        time: time,
                        numberOfPeople: numberOfPeople,
                        tableNumber: table.number,
                      ),
                      SizedBox(height: 60.h),
                      TableVisualization(table: table),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: BlocBuilder<TablesCubit, TablesState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: 'CONFIRM RESERVATION',
                      backgroundColor: AppColors.red,
                      isLoading: state is TablesLoading,
                      onTap: state is TablesLoading
                          ? null
                          : () => _confirmReservation(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
