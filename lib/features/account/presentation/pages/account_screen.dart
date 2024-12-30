import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/helpers/l10n.dart';
import 'package:buenro_hotels/common/helpers/locale_provider.dart';
import 'package:buenro_hotels/common/res/strings.dart';
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
      appBar: AppBar(title: Text('Account')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings.getString(context, 'Settings')),
            SizedBox(height: 20),
            DropdownButton<Locale>(
              value: currentLocale,
              items: [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('fr'),
                  child: Text('French'),
                ),
                DropdownMenuItem(
                  value: Locale('es'),
                  child: Text('Spanish'),
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
