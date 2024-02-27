// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/extensions/sizes.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    log('disposed');
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    //No momento que renderizar o objeto SplashPage na minha tela eu vou ter um tempo entre construir esse objeto e renderizar um frame nessa tela
    //quando eu renderizar esse frame eu vou chamar a função inicializadora
    WidgetsBinding.instance.addPostFrameCallback((_) => Sizes.init(context));

    super.initState();
    timer;
  }

  Timer timer = Timer(const Duration(seconds: 2), (() => log('finished')));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nova tela: StatsPage'),
        ],
      )),
    );
  }
}
