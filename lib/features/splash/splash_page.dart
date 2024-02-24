// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mystock_app/common/constants/app_colors.dart';
import 'package:mystock_app/common/constants/app_text_style.dart';
import 'package:mystock_app/common/constants/routes.dart';
import 'package:mystock_app/features/onboarding/onboarding_page.dart';

import '../../common/widgets/custom_circular_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Timer init() {
    return Timer(Duration(seconds: 2), () {
      navigateToOnBoarding();
    });
  }

  void navigateToOnBoarding() {
    Navigator.pushReplacementNamed(context, NamedRoute.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [
                0.1,
                0.9,
              ],
              colors: AppColors.blueDarkGradient)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MyStock',
            //CopyWith copia a Classe de estilização em AppTextStyles e depois adiciona o color com a propriedade AppColors.white
            style: AppTextStyles.bigText.copyWith(color: AppColors.white),
          ),
          CustomCircularProgressIndicator()
        ],
      ),
    ));
  }
}
