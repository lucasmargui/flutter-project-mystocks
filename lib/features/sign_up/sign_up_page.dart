// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text('Spend Smarter',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.bluedarkOne)),
        Text('Save More',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.bluedarkOne)),
        Image.asset('assets/images/sign_up_image.png'),
        TextFormField(),
        TextField(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16,
          ),
          child: PrimaryButton(
            text: 'Sign Up',
            onPressed: () => log('message'),
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
      ]),
    );
  }
}
