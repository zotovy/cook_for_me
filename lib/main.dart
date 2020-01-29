import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/localization.dart';
import 'package:food_app/services/database.dart';
import 'package:food_app/ui/home.dart';
import 'package:food_app/ui/intro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_app/ui/login.dart';
import 'package:food_app/ui/signup.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'data/userData.dart';

void main() => runApp(MyApp());

Logger logger = Logger();

class MyApp extends StatelessWidget {
  Widget _getPage() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
          return FutureBuilder(
            future: DatabaseServices.getUserById(
                Provider.of<UserData>(context).currentUserId),
            builder: (BuildContext context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                default:
                  return HomePage(snapshot.data);
              }
            },
          );
        } else if (snapshot.hasData && snapshot.data.uid == null) {
          return IntroScreen();
        } else {
          return Scaffold();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
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
          logger.w('Error finding $locale. Choose EN as main language');
          return supportedLocales.first;
        },
        theme: ThemeData(
          primaryColor: Color(0xFF4C84FF),
          fontFamily: 'Proxima Nova',
        ),
        title: 'Food+',
        home: _getPage(),
        routes: {
          LoginScreen.id: (_) => LoginScreen(),
          SignUpScreen.id: (_) => SignUpScreen(),
        },
      ),
    );
  }
}
