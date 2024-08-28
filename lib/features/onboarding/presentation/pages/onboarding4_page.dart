import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:udrive/core/constants/assets_constant.dart';
import 'package:udrive/features/onboarding/presentation/widgets/onboarding4_buttom.dart';

@RoutePage<dynamic>()
class Onboarding4Page extends StatelessWidget {
  const Onboarding4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bigTruck,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .65,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Onboarding4Buttom(),
          ),
        ],
      ),
    );
  }
}
