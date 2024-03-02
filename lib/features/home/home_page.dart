// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mystock_app/app.dart';
import 'package:mystock_app/common/constants/app_text_styles.dart';
import 'package:mystock_app/common/constants/routes.dart';
import 'package:mystock_app/common/extensions/sizes.dart';
import 'package:mystock_app/common/widgets/app_header.dart';
import 'package:mystock_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:mystock_app/common/widgets/primary_button.dart';
import 'package:mystock_app/features/home/home_controller.dart';
import 'package:mystock_app/features/home/home_state.dart';
import 'package:mystock_app/services/secure_storage.dart';

import '../../common/constants/app_colors.dart';
import '../../locator/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;

  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  final controller = locator.get<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const AppHeader(),
        Positioned(
          left: 24.w,
          right: 24.w,
          top: 155.h,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 32.h,
            ),
            decoration: const BoxDecoration(
                color: AppColors.bluedarkOne,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                )),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        textScaleFactor: textScaleFactor,
                        style: AppTextStyles.mediumText16w600
                            .apply(color: AppColors.white),
                      ),
                      Text(
                        '\$ 1,556.00',
                        textScaleFactor: textScaleFactor,
                        style: AppTextStyles.mediumText30
                            .apply(color: AppColors.white),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (() => log('options')),
                    child: PopupMenuButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.more_horiz,
                        color: AppColors.white,
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          height: 24.0,
                          child: Text('Item 1'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.06),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Icon(Icons.arrow_downward,
                            color: AppColors.white, size: iconSize),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Income',
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.mediumText16w500.apply(
                              color: AppColors.white,
                            ),
                          ), // Text
                          Text(
                            '\$ 1,840.00',
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.mediumText20.apply(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.06),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Icon(Icons.arrow_upward,
                            color: AppColors.white, size: iconSize),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expenses',
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.mediumText16w500.apply(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            '\$ 2,824.00',
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.mediumText20.apply(
                              color: AppColors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
        Positioned(
          top: 397.h,
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Transaction History',
                        style: AppTextStyles.mediumText18,
                      ),
                      Text(
                        'See all',
                        style: AppTextStyles.inputLabelText,
                      )
                    ],
                  )),
              Expanded(
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        if (controller.state is HomeLoadingState) {
                          return const CustomCircularProgressIndicator(
                            color: AppColors.bluedarkOne,
                          );
                        }

                        if (controller.state is HomeErrorState)
                          return Center(
                            child: Text('An error has ocurred'),
                          );

                        if (controller.transactions.isEmpty)
                          return Center(
                            child: Text('There is no transactions'),
                          );

                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller.transactions.length,
                          itemBuilder: ((context, index) {
                            final item = controller.transactions[index];

                            final color = item.value.isNegative
                                ? AppColors.outcome
                                : AppColors.income;
                            final value = "\$ ${item.value.toStringAsFixed(2)}";
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              leading: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.antiFlashWhite,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(
                                  Icons.monetization_on_outlined,
                                ),
                              ),
                              title: Text(
                                item.title,
                                style: AppTextStyles.mediumText16w500,
                              ),
                              subtitle: Text(
                                DateTime.fromMicrosecondsSinceEpoch(item.date)
                                    .toString(),
                                style: AppTextStyles.mediumText16w500,
                              ),
                              trailing: Text(
                                value,
                                style: AppTextStyles.mediumText18
                                    .apply(color: color),
                              ),
                            );
                          }),
                        );
                      })),
            ],
          ),
        )
      ],
    ));
  }
}
