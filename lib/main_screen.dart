// main_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/helpers/app_router.gr.dart';
import 'package:buenro_hotels/core/di/injector.dart';
import 'package:buenro_hotels/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/res/strings.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HotelsBloc>()),
        BlocProvider(create: (context) => getIt<FavouritesBloc>())
      ],
      child: AutoTabsScaffold(
          lazyLoad: false,
          routes: const [
            OverviewRoute(),
            HotelsRoute(),
            FavouritesRoute(),
            AccountRoute()
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.dashboard),
                  label: AppStrings.getString(context, 'overview'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.hotel),
                  label: AppStrings.getString(context, 'hotels'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.star),
                  label: AppStrings.getString(context, 'favourites'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                  label: AppStrings.getString(context, 'account'),
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: Colors.blue,
              onTap: tabsRouter.setActiveIndex,
            );
          }),
    );
  }
}
