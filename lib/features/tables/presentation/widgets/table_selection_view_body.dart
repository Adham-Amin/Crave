import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/features/tables/data/models/table_model.dart';
import 'package:crave/features/tables/presentation/cubit/tables_cubit.dart';
import 'package:crave/features/tables/presentation/views/confirmation_view.dart';
import 'package:crave/features/tables/presentation/widgets/tables_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableSelectionViewBody extends StatefulWidget {
  const TableSelectionViewBody({
    super.key,
    required this.date,
    required this.time,
    required this.numberOfPeople,
  });

  final DateTime date;
  final String time;
  final int numberOfPeople;

  @override
  State<TableSelectionViewBody> createState() => _TableSelectionViewBodyState();
}

class _TableSelectionViewBodyState extends State<TableSelectionViewBody> {
  int? _selectedTableNumber;

  final List<TableModel> _tables = [
    TableModel(number: 1, type: TableType.fourPerson, isAvailable: true),
    TableModel(number: 2, type: TableType.fourPerson, isAvailable: true),
    TableModel(number: 3, type: TableType.fourPerson, isAvailable: true),
    TableModel(number: 4, type: TableType.fourPerson, isAvailable: true),
    TableModel(number: 5, type: TableType.fourPerson, isAvailable: true),
    TableModel(number: 6, type: TableType.fourPerson, isAvailable: true),
    TableModel(number: 7, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 8, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 9, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 10, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 11, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 12, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 13, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 14, type: TableType.sixPerson, isAvailable: true),
    TableModel(number: 15, type: TableType.sixPerson, isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Text(
                'Now Its Time To Choose\nYour Table',
                style: AppStyles.textBold24.copyWith(
                  color: AppColors.white,
                  fontSize: 28.sp,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: TablesGrid(
                tables: _tables,
                selectedTableNumber: _selectedTableNumber,
                onTableSelected: (number) =>
                    setState(() => _selectedTableNumber = number),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: CustomButton(
                title: 'Next',
                backgroundColor: AppColors.red,
                onTap: _selectedTableNumber != null
                    ? () {
                        final selectedTable = _tables.firstWhere(
                          (t) => t.number == _selectedTableNumber,
                        );
                        final cubit = context.read<TablesCubit>();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: ConfirmationView(
                                date: widget.date,
                                time: widget.time,
                                numberOfPeople: widget.numberOfPeople,
                                table: selectedTable,
                              ),
                            ),
                          ),
                        );
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
