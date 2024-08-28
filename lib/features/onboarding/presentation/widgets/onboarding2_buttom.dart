import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_rich_text.dart';
import 'package:udrive/features/onboarding/onboarding_constants.dart';
import 'package:udrive/navigator/router.gr.dart';

class Onboarding2Buttom extends StatelessWidget {
  const Onboarding2Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          ColumnSizedBox(15.h),
          GenericRichText(
            text: lblMakeYour,
            size: 30.sp,
            lineHeight: 1.2,
            weight: FontWeight.w700,
            color: deepBlue,
          ),
          ColumnSizedBox(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GenericRichText(
              text: lblFindThe,
              size: 12.sp,
              lineHeight: 1.2,
              weight: FontWeight.w500,
              color: grey,
            ),
          ),
          ColumnSizedBox(20.h),
          GestureDetector(
            onTap: () => context.pushRoute(const Onboarding3Route()),
            child: SvgPicture.asset(
              pButton,
            ),
          ),
        ],
      ),
    );
  }
}
