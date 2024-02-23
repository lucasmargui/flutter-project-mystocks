import 'package:flutter/material.dart';
import 'package:mystock_app/features/sign_up/sign_up_page.dart';
import 'package:mystock_app/features/splash/splash_page.dart';

import 'features/onboarding/onboarding_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}
