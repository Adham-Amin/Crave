import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/features/tables/data/models/table_model.dart';
import 'package:crave/features/tables/presentation/widgets/table_shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TablesGrid extends StatelessWidget {
  const TablesGrid({
    super.key,
    required this.tables,
    required this.selectedTableNumber,
    required this.onTableSelected,
  });

  final List<TableModel> tables;
  final int? selectedTableNumber;
  final ValueChanged<int> onTableSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.darkGrey.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
        ),
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final table = tables[index];
          final isSelected = selectedTableNumber == table.number;

          if (table.type == TableType.fourPerson) {
            return FourPersonTableWidget(
              tableNumber: table.number,
              isSelected: isSelected,
              onTap: () => onTableSelected(table.number),
            );
          } else {
            return SixPersonTableWidget(
              tableNumber: table.number,
              isSelected: isSelected,
              onTap: () => onTableSelected(table.number),
            );
          }
        },
      ),
    );
  }
}
