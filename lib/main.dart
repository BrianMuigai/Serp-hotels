import 'package:buenro_hotels/common/helpers/app_router.dart';
import 'package:buenro_hotels/common/res/strings.dart';
import 'package:buenro_hotels/common/widgets/global_bloc_observer.dart';
import 'package:buenro_hotels/di/injector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kReleaseMode) {
    await dotenv.load(fileName: "env/.env");
  } else {
    Bloc.observer = AppGlobalBlocObserver();
    await dotenv.load(fileName: "env/.dev.env");
  }
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
