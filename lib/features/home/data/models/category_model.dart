import 'package:crave/core/utils/app_assets.dart';

class CategoryModel {
  final String image;
  final String name;

  CategoryModel({required this.image, required this.name});

  static List<CategoryModel> categoryList = [
    CategoryModel(image: AppAssets.imagesBreakfast, name: 'Break Fast'),
    CategoryModel(image: AppAssets.imagesLunch, name: 'Lunch'),
    CategoryModel(image: AppAssets.imagesDinner, name: 'Dinner'),
    CategoryModel(image: AppAssets.imagesHealthy, name: 'Healthy'),
  ];
}
