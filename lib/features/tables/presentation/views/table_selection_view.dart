import 'package:crave/features/tables/presentation/widgets/table_selection_view_body.dart';
import 'package:flutter/material.dart';

class TableSelectionView extends StatelessWidget {
  const TableSelectionView({
    super.key,
    required this.date,
    required this.time,
    required this.numberOfPeople,
  });

  final DateTime date;
  final String time;
  final int numberOfPeople;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableSelectionViewBody(
        date: date,
        time: time,
        numberOfPeople: numberOfPeople,
      ),
    );
  }
}
