import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/constants/colors_constant.dart';
import 'package:udrive/features/home/domain/entities/user_entity.dart';
import 'package:udrive/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LayoutPage extends StatelessWidget {
  final UserEntity userEntity;
  const LayoutPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return AutoTabsScaffold(
      routes: [
        HomeRoute(userEntity: userEntity),
        HomeRoute(userEntity: userEntity),
        HomeRoute(userEntity: userEntity),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: cardGrey)),
        ),
        child: BottomNavigationBar(
          backgroundColor: white,
          selectedItemColor: blue,
          unselectedItemColor: grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 10.sp,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) async {
            tabsRouter.setActiveIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: blue,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: grey,
              ),
              activeIcon: Icon(
                Icons.star,
                color: blue,
              ),
              label: 'Start',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: grey,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: blue,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
