import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mystock_app/common/extensions/extensions.dart';

import '../../common/constants/constants.dart';
import '../../common/widgets/widgets.dart';
import '../../locator.dart';
import 'stats_controller.dart';
import 'stats_state.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage>
    with SingleTickerProviderStateMixin {
  final _statsController = locator.get<StatsController>();
  late final TabController _periodTabController;

  @override
  void initState() {
    super.initState();
    _statsController.getTrasactionsByPeriod();
    _periodTabController = TabController(
      initialIndex: _statsController.selectedPeriod.index,
      length: _statsController.periods.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _periodTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppHeader.noBackground(title: 'Statistics'),
          Positioned(
            top: 150.h,
            left: 8.w,
            right: 8.w,
            bottom: 0,
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return TabBar(
                      controller: _periodTabController,
                      onTap: (index) => setState(() {
                        _statsController.getTrasactionsByPeriod(
                            period: StatsPeriod.values[index]);
                      }),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.bluedarkOne,
                      ),
                      splashBorderRadius: BorderRadius.circular(8.0),
                      tabs: _statsController.periods
                          .map(
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                e.name.capitalize(),
                                textAlign: TextAlign.center,
                                style: _statsController.selectedPeriod.name ==
                                        e.name
                                    ? AppTextStyles.smallText13.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      )
                                    : AppTextStyles.smallText13.copyWith(
                                        color: AppColors.bluedarkOne,
                                      ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                const SizedBox(height: 32.0),
                Flexible(
                  child: AnimatedBuilder(
                    animation: _statsController,
                    builder: (context, child) {
                      if (_statsController.state is StatsStateLoading) {
                        return const Center(
                          child: CustomCircularProgressIndicator(
                            color: AppColors.green,
                          ),
                        );
                      }

                      if (_statsController.state is StatsStateSuccess) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 24.0,
                          ),
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBorder: const BorderSide(
                                    color: AppColors.bluedarkOne,
                                  ),
                                  tooltipBgColor: AppColors.antiFlashWhite,
                                  getTooltipItems: (touchedSpots) {
                                    return touchedSpots.map((e) {
                                      return LineTooltipItem(
                                        '\$${e.y.toStringAsFixed(2)}',
                                        AppTextStyles.smallText.copyWith(
                                          color: AppColors.bluedarkOne,
                                        ),
                                      );
                                    }).toList();
                                  },
                                ),
                              ),
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: _statsController.interval,
                                    getTitlesWidget: (value, meta) {
                                      String text;

                                      switch (_statsController.selectedPeriod) {
                                        case StatsPeriod.day:
                                          text = '${value.toInt()}h';
                                          break;

                                        case StatsPeriod.week:
                                          text =
                                              _statsController.dayName(value);
                                          break;

                                        case StatsPeriod.month:
                                          text = 'W${(value + 1).toInt()}';
                                          break;

                                        case StatsPeriod.year:
                                          text =
                                              _statsController.monthName(value);
                                          break;
                                      }

                                      return Text(text);
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              minX: _statsController.minX,
                              maxX: _statsController.maxX,
                              minY: _statsController.minY,
                              maxY: _statsController.maxY,
                              lineBarsData: [
                                LineChartBarData(
                                  preventCurveOverShooting: true,
                                  spots: _statsController.valueSpots,
                                  isCurved: true,
                                  barWidth: 2,
                                  color: AppColors.bluedarkOne,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.bluedarkOne.withOpacity(0.20),
                                        AppColors.bluedarkTwo.withOpacity(0),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Transactions',
                        style: AppTextStyles.mediumText18,
                      ),
                      GestureDetector(
                        onTap: _statsController.sortTransactions,
                        child: const Icon(
                          Icons.sort,
                          color: AppColors.bluedarkOne,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: AnimatedBuilder(
                      animation: _statsController,
                      builder: (context, child) {
                        if (_statsController.state is StatsStateLoading) {
                          return const Center(
                            child: CustomCircularProgressIndicator(
                              color: AppColors.bluedarkOne,
                            ),
                          );
                        }
                        return TransactionListView(
                          transactionList: _statsController.transactions,
                          onChange: () {
                            _statsController.getTrasactionsByPeriod();
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
