import 'package:flutter/material.dart';
import '../constants/constants.dart';

enum SnackBarType { success, warning, error, general }

mixin CustomSnackBar<T extends StatefulWidget> on State<T> {
  void showCustomSnackBar({
    required BuildContext context,
    required String text,
    SnackBarType type = SnackBarType.general,
  }) {
    Color setColor() {
      switch (type) {
        case SnackBarType.error:
          return AppColors.error;
        case SnackBarType.success:
          return AppColors.green;
        case SnackBarType.warning:
          return AppColors.notification;
        case SnackBarType.general:
          return AppColors.grey;
      }
    }

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: AppTextStyles.smallText.apply(
            color: AppColors.iceWhite,
          ),
        ),
        backgroundColor: setColor(),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
