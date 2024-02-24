// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mystock_app/features/onboarding/onboarding_page.dart';
import 'package:mystock_app/features/sign_up/sign_up_page.dart';

import 'package:mystock_app/features/splash/splash_page.dart';

import 'common/constants/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage()
      },
    );
  }
}
