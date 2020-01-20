import 'package:flutter/material.dart';
import 'package:food_app/localization.dart';
import 'package:food_app/ui/intro/intro_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        print('invalid location. Choise EN');
        return supportedLocales.first;
      },
      theme: ThemeData(
        primaryColor: Color(0xFF4C84FF),
        fontFamily: 'Proxima Nova',
      ),
      title: 'Food+',
      home: IntroScreen(),
    );
  }
}
