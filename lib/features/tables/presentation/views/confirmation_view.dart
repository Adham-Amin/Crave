import 'package:crave/features/tables/data/models/table_model.dart';
import 'package:crave/features/tables/presentation/widgets/confirmation_view_body.dart';
import 'package:flutter/material.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfirmationViewBody(
        date: date,
        time: time,
        numberOfPeople: numberOfPeople,
        table: table,
      ),
    );
  }
}
