import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tomatina/helpers/multilanguages.dart';
import 'package:tomatina/screens/diseases/earlyBlight.dart';
import 'package:tomatina/screens/diseases/lateblight.dart';
import 'package:tomatina/screens/diseases/list.dart';
import 'package:tomatina/screens/diseases/septorialLeafSpot.dart';
import 'package:tomatina/screens/diseases/targetspot.dart';
import 'package:tomatina/screens/diseases/yellowleaf.dart';
import 'package:tomatina/screens/home/homepage.dart';
import 'package:tomatina/screens/login/forgot.dart';
import 'package:tomatina/screens/login/LanguageScreen.dart';
import 'package:tomatina/screens/login/LanguageScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tomatina/screens/login/welcomeScreen.dart';
import 'package:tomatina/screens/outputs/healthy.dart';
import 'package:tomatina/screens/outputs/notFound.dart';
import 'package:tomatina/screens/tutorials/tutorial.dart';
import 'package:firebase_core/firebase_core.dart';

import 'helpers/appLanguages.dart';
import 'screens/login/login.dart';
import 'screens/login/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  // ignore: use_key_in_widget_constructors
  const MyApp({required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return ChangeNotifierProvider<AppLanguage>(
        create: (ctx) => appLanguage,
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: model.appLocal,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: _auth.currentUser != null
                ? const LanguageScreen()
                : const WelcomeScreen(),
            routes: {
              WelcomeScreen.routeName: (context) => const WelcomeScreen(),
              SigninScreen.routeName: (context) => SigninScreen(),
              RegistrationScreen.routeName: (context) =>
                  const RegistrationScreen(),
              LanguageScreen.routeName: (context) => const LanguageScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              TutorialScreen.routeName: (context) => const TutorialScreen(),
              // ignore: equal_keys_in_map
              ListScreen.routeName: (context) => const ListScreen(),
              Disease1Screen.routeName: (context) => const Disease1Screen(),

              LateBlightScreen.routeName: (context) => const LateBlightScreen(),
              TargetSpotScreen.routeName: (context) => const TargetSpotScreen(),
              SeptorialLeafSpotScreen.routeName: (context) =>
                  const SeptorialLeafSpotScreen(),
              YellowLeafScreen.routeName: (context) => const YellowLeafScreen(),
              HealthyScreen.routeName: (context) => const HealthyScreen(),
              NotFoundScreen.routeName: (context) => const NotFoundScreen(),
              ForgotScreen.routeName: (context) => const ForgotScreen(),
            },
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('si', ''),
              Locale('ta', ''),
            ],
            localizationsDelegates: const [
              MultiLanguages.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        }));
  }
}
