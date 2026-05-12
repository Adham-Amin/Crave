import 'package:crave/features/tables/data/models/table_model.dart';
import 'package:crave/features/tables/presentation/widgets/table_shape_widget.dart';
import 'package:flutter/material.dart';

class TableVisualization extends StatelessWidget {
  const TableVisualization({
    super.key,
    required this.table,
  });

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: table.type == TableType.fourPerson
          ? FourPersonTableWidget(
              tableNumber: table.number,
              isSelected: true,
              onTap: () {},
            )
          : SixPersonTableWidget(
              tableNumber: table.number,
              isSelected: true,
              onTap: () {},
            ),
    );
  }
}
