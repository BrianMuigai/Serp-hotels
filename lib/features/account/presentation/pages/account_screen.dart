import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/notifiers/locale_provider.dart';
import 'package:buenro_hotels/common/res/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final currentLocale = provider.locale;

    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.getString(context, 'account'))),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.getString(context, 'settings')),
            SizedBox(height: 20),
            DropdownButton<Locale>(
              value: currentLocale,
              items: [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text(AppLocalizations.getString(context, 'english')),
                ),
                DropdownMenuItem(
                  value: Locale('fr'),
                  child: Text(AppLocalizations.getString(context, 'french')),
                ),
                DropdownMenuItem(
                  value: Locale('es'),
                  child: Text(AppLocalizations.getString(context, 'spanish')),
                ),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  provider.setLocale(locale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
