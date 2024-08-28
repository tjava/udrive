import 'package:udrive/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/utils/globa_keys.dart';
import 'package:udrive/navigator/router.dart';

class MainUdrive extends StatelessWidget {
  const MainUdrive({super.key});

  static final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Udrive',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: white,
            appBarTheme: const AppBarTheme(
              backgroundColor: white,
              surfaceTintColor: white,
              centerTitle: true,
              elevation: 0,
            ),
          ),
          scaffoldMessengerKey: scaffoldMessengerKey,
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
