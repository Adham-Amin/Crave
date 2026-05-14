import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_error.dart';
import 'package:crave/features/table_history/presentation/cubit/table_history_cubit.dart';
import 'package:crave/features/table_history/presentation/widgets/reservation_card.dart';
import 'package:crave/features/table_history/presentation/widgets/table_history_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TablesHistoryViewBody extends StatelessWidget {
  const TablesHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.hs,
            Text('Table Reservation', style: AppStyles.textBold24),
            4.hs,
            Text(
              'Your latest booking',
              style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
            ),
            32.hs,
            Expanded(
              child: BlocBuilder<TableHistoryCubit, TableHistoryState>(
                builder: (context, state) {
                  if (state is TableHistoryLoading) {
                    return const TableHistoryShimmer();
                  }
                  if (state is TableHistoryError) {
                    return CustomError(message: state.message);
                  }
                  if (state is TableHistorySuccess) {
                    return ReservationCard(
                      reservation: state.tableHistoryResponse,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
