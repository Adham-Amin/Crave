import 'package:crave/features/table_history/data/models/table_history_response/table_history_response.dart';
import 'package:crave/features/table_history/presentation/widgets/reservation_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TableHistoryShimmer extends StatelessWidget {
  const TableHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ReservationCard(
        reservation: TableHistoryResponse(
          date: '2024-06-01',
          theTime: '19:00',
          numbersPeople: 4,
        ),
      ),
    );
  }
}
