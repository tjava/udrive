import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/core/widgets/generic_text.dart';
import 'package:udrive/features/home/domain/entities/user_entity.dart';

@RoutePage<dynamic>()
class HomePage extends StatelessWidget {
  final UserEntity userEntity;
  const HomePage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenericText(
              text: userEntity.name,
              size: 16.sp,
              weight: FontWeight.w600,
              color: blue,
            ),
            GenericText(
              text: userEntity.email,
              size: 14.sp,
              weight: FontWeight.w500,
              color: blue,
            ),
          ],
        ),
      ),
    );
  }
}
