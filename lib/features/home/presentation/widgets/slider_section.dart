import 'package:carousel_slider/carousel_slider.dart';
import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/features/home/data/models/bannar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key, required this.sliders});

  final List<BannarModel> sliders;

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.sliders.length,
          options: CarouselOptions(
            height: 180.h,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, _) {
              setState(() {
                activeIndex = index;
              });
            },
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      widget.sliders[itemIndex].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
        ),
        16.hs,
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.sliders.length,
          effect: ExpandingDotsEffect(
            spacing: 8.0,
            dotWidth: 7,
            dotHeight: 7,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 1.5,
            dotColor: AppColors.grey,
            activeDotColor: AppColors.orange,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}
