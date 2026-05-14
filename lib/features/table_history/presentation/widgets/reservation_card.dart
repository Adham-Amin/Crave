import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/table_history/data/models/table_history_response/table_history_response.dart';
import 'package:crave/features/table_history/presentation/widgets/detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key, required this.reservation});

  final TableHistoryResponse reservation;

  String get _formattedDate {
    try {
      final parsed = DateTime.parse(reservation.date!);
      return DateFormat('MMMM d, y').format(parsed);
    } catch (_) {
      return reservation.date ?? 'N/A';
    }
  }

  String get _formattedTime {
    try {
      final parsed = DateFormat('HH:mm:ss').parse(reservation.theTime!);
      return DateFormat('h:mm a').format(parsed);
    } catch (_) {
      return reservation.theTime ?? 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.orange,
                        AppColors.orange.withValues(alpha: 0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Icon(
                          Icons.table_bar_rounded,
                          color: AppColors.white,
                          size: 28.r,
                        ),
                      ),
                      16.ws,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Table ${reservation.table?.numberTable ?? '-'}',
                              style: AppStyles.textBold22.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            4.hs,
                            Text(
                              '${reservation.table?.numChairs ?? 0} Chairs',
                              style: AppStyles.textRegular14.copyWith(
                                color: AppColors.white.withValues(alpha: 0.85),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          'Confirmed',
                          style: AppStyles.textMedium14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      DetailRow(
                        icon: Icons.calendar_today_rounded,
                        label: 'Date',
                        value: _formattedDate,
                      ),
                      16.hs,
                      DetailRow(
                        icon: Icons.access_time_rounded,
                        label: 'Time',
                        value: _formattedTime,
                      ),
                      16.hs,
                      DetailRow(
                        icon: Icons.people_rounded,
                        label: 'Guests',
                        value: '${reservation.numbersPeople ?? 0} People',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
