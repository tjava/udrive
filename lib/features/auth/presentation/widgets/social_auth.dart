import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/core/widgets/row_sized_box.dart';
import 'package:udrive/features/auth/auth_constants.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: deepBlue,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(google),
                  RowSizedBox(10.w),
                  GenericText(
                    text: lblGoogle,
                    size: 14.sp,
                    weight: FontWeight.w600,
                    color: deepBlue,
                  ),
                ],
              ),
            ),
          ),
          RowSizedBox(20.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: deepBlue,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(apple),
                  RowSizedBox(10.w),
                  GenericText(
                    text: lblApple,
                    size: 14.sp,
                    weight: FontWeight.w600,
                    color: deepBlue,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
