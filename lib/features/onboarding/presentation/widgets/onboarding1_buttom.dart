import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_button.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/core/widgets/row_sized_box.dart';
import 'package:udrive/features/auth/auth_constants.dart';
import 'package:udrive/features/onboarding/onboarding_constants.dart';
import 'package:udrive/navigator/router.gr.dart';

class Onboarding1Buttom extends StatelessWidget {
  const Onboarding1Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
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
          ColumnSizedBox(20.h),
          GenericText(
            text: lblHello,
            size: 30.sp,
            weight: FontWeight.w700,
            color: deepBlue,
          ),
          ColumnSizedBox(20.h),
          GenericText(
            text: lblChoose,
            size: 12.sp,
            weight: FontWeight.w500,
            color: grey,
          ),
          ColumnSizedBox(15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GenericButton(
              label: lblDriver,
              labelColor: white,
              width: MediaQuery.of(context).size.width,
              onClick: () => context.pushRoute(const Onboarding2Route()),
            ),
          ),
          ColumnSizedBox(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GenericButton(
              label: lblMechanic,
              labelColor: deepBlue,
              isPrimary: false,
              width: MediaQuery.of(context).size.width,
              onClick: () => context.pushRoute(const Onboarding2Route()),
            ),
          ),
          ColumnSizedBox(15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenericText(
                text: lblHaveAcct,
                size: 12.sp,
                weight: FontWeight.w400,
                color: grey,
              ),
              RowSizedBox(5.w),
              InkWell(
                onTap: () => context.pushRoute(const LoginRoute()),
                child: GenericText(
                  text: lblLogin,
                  size: 12.sp,
                  weight: FontWeight.w600,
                  color: blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
