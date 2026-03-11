import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: isSelected ? 42.r : 40.r,
            backgroundColor: AppColors.orange,
            child: CircleAvatar(
              radius: isSelected ? 40.r : 40.r,
              backgroundImage: AssetImage(category.image),
            ),
          ),
          8.hs,
          Text(
            category.name,
            style: isSelected
                ? AppStyles.textRegular14.copyWith(color: AppColors.orange)
                : AppStyles.textRegular14,
          ),
        ],
      ),
    );
  }
}
