import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(path: '/', page: AuthcheckPage.page),
        AutoRoute(path: '/responsivepage', page: ResponsivePage.page),

        AutoRoute(path: '/moisturePage', page: CommonGraphPage.page),
        AutoRoute(path: '/npkPage', page: SoilNpkPage.page),

        AutoRoute(path: '/webhomepage', page: WebHomePage.page),
        AutoRoute(path: '/homepage', page: HomePage.page),
      ];
}
