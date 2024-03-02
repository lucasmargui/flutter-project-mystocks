// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Text('MyStock',
          textAlign: TextAlign.center,
          style:
              AppTextStyles.mediumText.copyWith(color: AppColors.bluedarkOne)),
    );
  }
}
