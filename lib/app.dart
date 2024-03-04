// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/sign_up/sign_up_page.dart';
import '../../features/splash/splash_page.dart';
import 'common/constants/routes.dart';
import 'common/models/models.dart';
import 'features/home/home_page_view.dart';
import 'features/profile/profile_page.dart';
import 'features/sign_in/sign_in_page.dart';
import 'features/stats/stats_page.dart';
import 'features/transaction/transaction_page.dart';
import 'features/wallet/wallet_page.dart';
import 'themes/default_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoute.splash,
      theme: CustomTheme().defaultTheme,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.home: (context) => const HomePageView(),
        NamedRoute.profile: (context) => const ProfilePage(),
        NamedRoute.stats: (context) => const StatsPage(),
        NamedRoute.wallet: (context) => const WalletPage(),
        NamedRoute.transaction: (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return TransactionPage(
            transaction: args != null ? args as TransactionModel : null,
          );
        },
      },
    );
  }
}
