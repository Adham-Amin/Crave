import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Prefs.getUser();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            32.hs,
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36.r,
                    backgroundColor: AppColors.orange,
                    child: Text(
                      (user?.name ?? 'U')[0].toUpperCase(),
                      style: AppStyles.textBold24.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  16.ws,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? 'User',
                          style: AppStyles.textSemiBold20.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        4.hs,
                        Text(
                          user?.email ?? '',
                          style: AppStyles.textRegular14.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            32.hs,
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.receipt_long_rounded,
                    title: 'My Orders',
                    onTap: () => context.push(AppRoutes.orders),
                  ),
                  _divider(),
                  ProfileMenuItem(
                    icon: Icons.table_bar_rounded,
                    title: 'Table Reservation',
                    onTap: () => context.push(AppRoutes.tableHistory),
                  ),
                  _divider(),
                  ProfileMenuItem(
                    icon: Icons.local_fire_department_rounded,
                    title: 'Calculate Calories',
                    onTap: () => context.push(AppRoutes.caloriesStore),
                  ),
                  _divider(),
                  ProfileMenuItem(
                    icon: Icons.favorite_rounded,
                    title: 'Favourite',
                    onTap: () => context.push(AppRoutes.wishlist),
                  ),
                ],
              ),
            ),
            24.hs,
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ProfileMenuItem(
                icon: Icons.logout_rounded,
                title: 'Logout',
                iconColor: AppColors.red,
                titleColor: AppColors.red,
                showArrow: false,
                onTap: () async {
                  await Prefs.clearUserData();
                  if (context.mounted) {
                    context.go(AppRoutes.login);
                  }
                },
              ),
            ),
            32.hs,
          ],
        ),
      ),
    );
  }

  Widget _divider() => Divider(
    color: AppColors.grey.withValues(alpha: 0.15),
    height: 1,
    indent: 56.w,
  );
}
