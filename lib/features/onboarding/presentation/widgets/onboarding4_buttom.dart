import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_button.dart';
import 'package:udrive/core/widgets/generic_rich_text.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/core/widgets/row_sized_box.dart';
import 'package:udrive/features/auth/auth_constants.dart';
import 'package:udrive/features/auth/presentation/widgets/social_auth.dart';
import 'package:udrive/features/onboarding/onboarding_constants.dart';
import 'package:udrive/navigator/router.gr.dart';

class Onboarding4Buttom extends StatelessWidget {
  const Onboarding4Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ColumnSizedBox(12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GenericRichText(
                text: lblYourSuccessful,
                size: 30.sp,
                lineHeight: 1.2,
                weight: FontWeight.w700,
                color: deepBlue,
              ),
            ),
            ColumnSizedBox(10.h),
            GenericRichText(
              text: lblTakeYour,
              size: 12.sp,
              lineHeight: 1.6,
              weight: FontWeight.w500,
              color: grey,
            ),
            ColumnSizedBox(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: GenericButton(
                label: lblLoginAccount,
                labelColor: white,
                width: MediaQuery.of(context).size.width,
                onClick: () => context.pushRoute(const LoginRoute()),
              ),
            ),
            ColumnSizedBox(15.h),
            const SocialAuth(),
            ColumnSizedBox(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenericText(
                  text: lblNew,
                  size: 12.sp,
                  weight: FontWeight.w400,
                  color: grey,
                ),
                RowSizedBox(5.w),
                InkWell(
                  onTap: () => context.pushRoute(const RegisterRoute()),
                  child: GenericText(
                    text: lblCreate,
                    size: 12.sp,
                    weight: FontWeight.w600,
                    color: blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
