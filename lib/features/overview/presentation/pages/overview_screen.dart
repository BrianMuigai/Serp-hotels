// overview.dart
import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/res/l10n.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.getString(context, 'overview'))),
      body: Center(
          child: Text(
              '${AppLocalizations.getString(context, 'overview')} Screen')),
    );
  }
}
