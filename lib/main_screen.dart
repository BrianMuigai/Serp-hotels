// main_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/core/di/injector.dart';
import 'package:buenro_hotels/features/account/presentation/pages/account_screen.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:buenro_hotels/features/hotels/presentation/pages/hotels_screen.dart';
import 'package:buenro_hotels/features/overview/presentation/pages/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/res/strings.dart';
import 'features/favourites/presentation/pages/favourites_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    OverviewScreen(),
    HotelsScreen(),
    FavouritesScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HotelsBloc>()),
      ],
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard),
              label: AppStrings.overview,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.hotel),
              label: AppStrings.hotels,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: AppStrings.favourites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: AppStrings.account,
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
