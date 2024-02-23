// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  // VoidCallback é a mesma coisa que uma void Function, ou seja uma função que não tem retorno e a exclamação no final significa que ela pode ser nula
  // final VoidCallBack? = final void Function()? ;

  final VoidCallback? onPressed;
  final String text;
  const PrimaryButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(38.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(38.0),
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: 64.0,
            width: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38.0),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.1, 0.9],
                colors: onPressed != null
                    ? AppColors.blueDarkGradient
                    : AppColors.greyDarkGradient,
              ),
            ),
            child: Text(
              text,
              style:
                  AppTextStyles.mediumText18.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
