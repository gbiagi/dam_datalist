import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'screen_layouts/desktop_layout.dart';
import 'screen_layouts/mobile_layout.dart';
import 'settings/settings_controller.dart';
import 'app_data.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

    @override
Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (context) => AppData(),
    child: Consumer<AppData>(
      builder: (context, appData, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: appData.themeMode,
          home: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 600) {
                return DesktopLayout(settingsController: settingsController);
              }
              return MobileLayout(settingsController: settingsController);
            },
          ),
        );
      },
    ),
  );
}}