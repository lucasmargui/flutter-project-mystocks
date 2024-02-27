import 'package:flutter/material.dart';
import 'package:mystock_app/common/constants/routes.dart';
import 'package:mystock_app/common/widgets/primary_button.dart';
import 'package:mystock_app/services/secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home'),
        ],
      )),
    );
  }
}
