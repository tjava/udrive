import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/features/onboarding/presentation/widgets/onboarding2_buttom.dart';

@RoutePage<dynamic>()
class Onboarding2Page extends StatelessWidget {
  const Onboarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 20,
              child: Image.asset(phone),
            ),
            Positioned(
              top: -520,
              bottom: 0,
              right: 43,
              child: SvgPicture.asset(emoji1),
            ),
            Positioned(
              top: -200,
              bottom: 0,
              right: -190,
              child: Image.asset(emoji2),
            ),
            Positioned(
              top: -200,
              bottom: -80,
              left: -250,
              child: Image.asset(emoji3),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Onboarding2Buttom(),
            ),
          ],
        ),
      ),
    );
  }
}
