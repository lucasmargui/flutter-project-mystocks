// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mystock_app/app.dart';
import 'package:mystock_app/common/constants/app_text_style.dart';
import 'package:mystock_app/common/constants/routes.dart';
import 'package:mystock_app/common/extensions/sizes.dart';
import 'package:mystock_app/common/widgets/primary_button.dart';
import 'package:mystock_app/services/secure_storage.dart';

import '../../common/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;

  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.blueDarkGradient),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(500, 30),
                    bottomRight: Radius.elliptical(500, 300))),
            height: 287.h,
          ),
        ),
        Positioned(
            left: 24.0,
            right: 24.0,
            top: 74.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good afternoon,',
                      textScaleFactor: textScaleFactor,
                      style:
                          AppTextStyles.smallText.apply(color: AppColors.white),
                    ),
                    Text(
                      'Enjelin Morgeana,',
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyles.mediumText20
                          .apply(color: AppColors.white),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    color: AppColors.white.withOpacity(0.06),
                  ),
                  child: Stack(
                      alignment: const AlignmentDirectional(0.5, -0.5),
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.white,
                        ),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 181, 15),
                              borderRadius: BorderRadius.circular(4.0)),
                        )
                      ]),
                )
              ],
            ))
      ],
    ));
  }
}
