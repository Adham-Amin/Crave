import 'package:crave/core/utils/app_assets.dart';

class BannarModel {
  final String image;
  BannarModel({required this.image});

  static List<BannarModel> bannarList = [
    BannarModel(image: AppAssets.imagesBannarOne),
    BannarModel(image: AppAssets.imagesBannarTwo),
    BannarModel(image: AppAssets.imagesBannarThree),
  ];
}
