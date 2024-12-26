import 'package:buenro_hotels/common/helpers/app_router.dart';
import 'package:buenro_hotels/common/res/strings.dart';
import 'package:buenro_hotels/di/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      routerConfig: _appRouter.config(),
    );
  }
}
