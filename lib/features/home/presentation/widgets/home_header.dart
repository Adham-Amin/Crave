import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1499714608240-22fc6ad53fb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
        ),
      ),
      title: Text(
        'Hi, ${Prefs.getUser()?.name}',
        style: AppStyles.textSemiBold18,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none_outlined, size: 30),
      ),
    );
  }
}
