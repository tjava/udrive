import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/features/onboarding/presentation/widgets/onboarding1_buttom.dart';

@RoutePage<dynamic>()
class Onboarding1Page extends StatelessWidget {
  const Onboarding1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.language,
                  color: white,
                  size: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: SvgPicture.asset(
                logoWhite,
              ),
            ),
            const Onboarding1Buttom(),
          ],
        ),
      ),
    );
  }
}
