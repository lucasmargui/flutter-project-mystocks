// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../common/constants/constants.dart';
import '../../features/splash/splash.dart';

import '../../common/extensions/extensions.dart';
import '../../common/widgets/widgets.dart';
import '../../locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) => Sizes.init(context));
    super.initState();

    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      } else {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
        //Navigator.pushReplacementNamed(context, NamedRoute.initial);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [
                0.1,
                0.9,
              ],
              colors: AppColors.blueDarkGradient)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MyStock',
            //CopyWith copia a Classe de estilização em AppTextStyles e depois adiciona o color com a propriedade AppColors.white
            style: AppTextStyles.bigText50.copyWith(color: AppColors.white),
          ),
          CustomCircularProgressIndicator()
        ],
      ),
    ));
  }
}
