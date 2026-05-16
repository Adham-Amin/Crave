import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/wishlist/presentation/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new),),
        title: Text('Favorites', style: AppStyles.textBold24,),
      ),
      body: WishlistViewBody(),
    );
  }
}