import 'package:buenro_hotels/common/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuenroAppTheme extends StatelessWidget {
  final Widget child;
  const BuenroAppTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color(0xFFF4F4F4),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleSpacing: 8,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black,
              ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: child,
    );
  }
}
