// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mystock_app/common/constants/app_colors.dart';
import 'package:mystock_app/common/constants/app_text_style.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: AppColors.iceWhite,
                child: Image.asset('assets/images/man.png'),
              )),
          Text('Spend Smarter',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.bluedarkOne)),
          Text('Save More',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.bluedarkOne)),
          ElevatedButton(onPressed: () {}, child: Text('Get Started')),
          Text('Already have account? Log In',
              style: AppTextStyles.smallText.copyWith(color: AppColors.grey)),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}
