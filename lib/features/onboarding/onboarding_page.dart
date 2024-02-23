// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mystock_app/common/constants/app_colors.dart';
import 'package:mystock_app/common/constants/app_text_style.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.iceWhite,
        body: Align(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset('assets/images/man.png'),
              ),
              Text('Spend Smarter',
                  style: AppTextStyles.mediumText
                      .copyWith(color: AppColors.bluedarkOne)),
              Text('Save More',
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
                  onPressed: () {},
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
        ));
  }
}
