import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationDetailsList extends StatelessWidget {
  const ReservationDetailsList({
    super.key,
    required this.date,
    required this.time,
    required this.numberOfPeople,
    required this.tableNumber,
  });

  final String date;
  final String time;
  final int numberOfPeople;
  final int tableNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DetailRow(label: 'Resturant', value: 'Pargon Restaurant, Calicut'),
        _buildDivider(),
        _DetailRow(label: 'Date', value: date),
        _buildDivider(),
        _DetailRow(label: 'Time', value: time),
        _buildDivider(),
        _DetailRow(label: 'No Of Seats', value: numberOfPeople.toString()),
        _buildDivider(),
        _DetailRow(label: 'Table No', value: tableNumber.toString()),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.darkGrey,
      thickness: 1,
      height: 1,
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppStyles.textRegular16.copyWith(
              color: AppColors.grey,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppStyles.textMedium16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
