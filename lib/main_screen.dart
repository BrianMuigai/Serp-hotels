// main_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/helpers/app_router.gr.dart';
import 'package:buenro_hotels/common/res/l10n.dart';
import 'package:buenro_hotels/core/di/injector.dart';
import 'package:buenro_hotels/features/account/presentation/bloc/account_bloc.dart';
import 'package:buenro_hotels/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HotelsBloc>()),
        BlocProvider(create: (context) => getIt<FavouritesBloc>()),
        BlocProvider(create: (context) => getIt<AccountBloc>())
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
                  label: AppLocalizations.getString(context, 'overview'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.hotel),
                  label: AppLocalizations.getString(context, 'hotels'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.star),
                  label: AppLocalizations.getString(context, 'favourites'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                  label: AppLocalizations.getString(context, 'account'),
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
