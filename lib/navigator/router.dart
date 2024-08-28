import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: Onboarding1Route.page,
      path: '/onboarding1',
      initial: true,
    ),
    AutoRoute(
      page: Onboarding2Route.page,
      path: '/onboarding2',
    ),
    AutoRoute(
      page: Onboarding3Route.page,
      path: '/onboarding3',
    ),
    AutoRoute(
      page: Onboarding4Route.page,
      path: '/onboarding4',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: RegisterRoute.page,
      path: '/register',
    ),
    AutoRoute(
      page: LayoutRoute.page,
      path: '/layout',
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: '',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: 'learn',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: 'LiveSession',
        ),
      ],
    ),
  ];
}
