// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mystock_app/common/constants/app_colors.dart';
import 'package:mystock_app/common/constants/app_text_style.dart';
import 'package:mystock_app/common/constants/routes.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';
import '../sign_up/sign_up_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/onboarding_image.png'),
          ),
          Text('Spend Smarter',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.bluedarkOne)),
          Text('Save More',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.bluedarkOne)),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16,
            ),
            child: PrimaryButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, NamedRoute.signIn);
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          MultiTextButton(
            onPressed: () => log('message'),
            children: [
              Text('Already have account?',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.grey,
                  )),
              Text('Log In',
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.bluedarkThree)),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
