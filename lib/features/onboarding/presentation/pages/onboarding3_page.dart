import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_rich_text.dart';
import 'package:udrive/core/widgets/row_sized_box.dart';
import 'package:udrive/features/onboarding/onboarding_constants.dart';
import 'package:udrive/navigator/router.gr.dart';

@RoutePage<dynamic>()
class Onboarding3Page extends StatelessWidget {
  const Onboarding3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 10.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        height: 120.h,
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: cardGrey,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Image.asset(truck),
                      ),
                    ),
                    RowSizedBox(15.w),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset(cardLogoSvg),
                      ),
                    )
                  ],
                ),
                ColumnSizedBox(15.h),
                Image.asset(
                  mainTruck,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
                ColumnSizedBox(15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GenericRichText(
                    text: lblSolution,
                    size: 30.sp,
                    lineHeight: 1.2,
                    weight: FontWeight.w700,
                    color: deepBlue,
                  ),
                ),
                ColumnSizedBox(10.h),
                GenericRichText(
                  text: lblBePart,
                  size: 12.sp,
                  lineHeight: 1.2,
                  weight: FontWeight.w500,
                  color: grey,
                ),
                ColumnSizedBox(20.h),
                GestureDetector(
                  onTap: () => context.pushRoute(const Onboarding4Route()),
                  child: SvgPicture.asset(
                    pButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
