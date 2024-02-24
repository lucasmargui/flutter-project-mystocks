// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mystock_app/common/constants/app_text_style.dart';
import 'package:mystock_app/common/widgets/primary_button.dart';

import '../constants/app_colors.dart';

Future<void> customModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38.0), topRight: Radius.circular(38.0))),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38.0),
                topRight: Radius.circular(38.0))),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Ops, Algo deu errado.',
                  style: AppTextStyles.mediumText20
                      .copyWith(color: AppColors.bluedarkOne)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: PrimaryButton(
                  text: 'Tentar Novamente',
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
