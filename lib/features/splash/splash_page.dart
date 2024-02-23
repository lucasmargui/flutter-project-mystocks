// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
                colors: [
              Color.fromARGB(246, 1, 10, 24),
              Color.fromARGB(255, 0, 0, 0),
            ])),
        child: const Text(
          'MyStock',
          style: TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
