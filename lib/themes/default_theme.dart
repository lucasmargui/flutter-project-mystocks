import 'package:flutter/material.dart';
import '../common/constants/constants.dart';

class CustomTheme {
  CustomTheme._();

  factory CustomTheme() {
    return CustomTheme._();
  }

  ThemeData get defaultTheme {
    const defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.bluedarkOne,
      ),
    );

    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.bluedarkTwo,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.iceWhite,
        backgroundColor: AppColors.bluedarkOne,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.bluedarkTwo,
        ),
      ),
      tooltipTheme:
          const TooltipThemeData(textStyle: TextStyle(color: Colors.white)),
      tabBarTheme: const TabBarTheme(
        indicator: BoxDecoration(
          border: Border(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle:
            AppTextStyles.inputLabelText.copyWith(color: AppColors.grey),
        hintStyle:
            AppTextStyles.inputHintText.copyWith(color: AppColors.bluedarkOne),
        focusedBorder: defaultBorder,
        enabledBorder: defaultBorder,
        disabledBorder: defaultBorder,
        errorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}
