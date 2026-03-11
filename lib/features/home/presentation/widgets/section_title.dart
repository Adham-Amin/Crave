import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.textRegular24.copyWith(
        fontSize: 32.sp,
        fontFamily: GoogleFonts.juliusSansOne().fontFamily,
      ),
      textAlign: TextAlign.center,
    );
  }
}
