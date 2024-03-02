// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../../common/widgets/widgets.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  void dispose() {
    log('disposed');
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    timer;
  }

  Timer timer = Timer(const Duration(seconds: 2), (() => log('finished')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppHeader(
            title: 'StatsPage',
          ),
          Text('Nova tela: StatsPage'),
        ],
      ),
    );
  }
}
