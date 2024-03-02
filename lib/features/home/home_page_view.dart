// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import '../../common/constants/constants.dart';
import '../../common/widgets/widgets.dart';
import '../profile/profile.dart';
import '../stats/stats.dart';
import '../wallet/wallet.dart';
import 'home_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          StatsPage(),
          WalletPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColors.bluedarkOne,
        children: [
          CustomBottomAppBarItem(
            label: 'home',
            primaryIcon: Icons.home,
            secondaryIcon: Icons.home_outlined,
            onPressed: () => pageController.jumpToPage(0),
          ),
          CustomBottomAppBarItem(
            label: 'stats',
            primaryIcon: Icons.analytics,
            secondaryIcon: Icons.analytics_outlined,
            onPressed: () => pageController.jumpToPage(1),
          ),
          CustomBottomAppBarItem.empty(),
          CustomBottomAppBarItem(
            label: 'wallet',
            primaryIcon: Icons.wallet,
            secondaryIcon: Icons.wallet_outlined,
            onPressed: () => pageController.jumpToPage(2),
          ),
          CustomBottomAppBarItem(
            label: 'profile',
            primaryIcon: Icons.people,
            secondaryIcon: Icons.people_outlined,
            onPressed: () => pageController.jumpToPage(3),
          ),
        ],
      ),
    );
  }
}
