// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  PrimaryButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  BorderRadius _borderRadius = BorderRadius.circular(24.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Ink(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0.1, 0.9],
              colors: onPressed != null
                  ? AppColors.blueDarkGradient
                  : AppColors.greyDarkGradient,
            ),
          ),
          child: Align(
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
