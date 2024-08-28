import 'package:flutter_svg/svg.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/column_sized_box.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/features/auth/auth_constants.dart';
import 'package:udrive/features/auth/presentation/widgets/login_buttom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBlue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 100,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: SvgPicture.asset(logoSvg),
                  ),
                  ColumnSizedBox(10.h),
                  GenericText(
                    text: lblWelcome,
                    size: 30.sp,
                    weight: FontWeight.w700,
                    color: white,
                  ),
                  ColumnSizedBox(10.h),
                  GenericText(
                    text: lblPleaseLogin,
                    size: 12.sp,
                    weight: FontWeight.w500,
                    color: white,
                  ),
                ],
              ),
            ),
            // ColumnSizedBox(20.h),
            const Align(
              alignment: Alignment.bottomCenter,
              child: LoginButtom(),
            ),
          ],
        ),
      ),
    );
  }
}
