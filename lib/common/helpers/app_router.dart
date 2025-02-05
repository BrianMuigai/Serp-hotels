import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/helpers/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(page: OverviewRoute.page),
          AutoRoute(page: HotelsRoute.page),
          AutoRoute(page: FavouritesRoute.page),
          AutoRoute(page: AccountRoute.page)
        ]),
        AutoRoute(page: FullImageRoute.page)
      ];
}
