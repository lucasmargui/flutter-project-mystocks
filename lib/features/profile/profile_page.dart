// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mystock_app/services/auth_service.dart';
import 'package:mystock_app/services/secure_storage.dart';

import '../../common/widgets/widgets.dart';
import '../../locator/locator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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
    super.initState();
    timer;
  }

  Timer timer = Timer(const Duration(seconds: 2), (() => log('finished')));

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          const AppHeader(
            title: 'Profile',
          ),
          Text('ProfilePage'),
          TextButton(
            onPressed: () async {
              await locator.get<AuthService>().signOut();
              await SecureStorageService().deleteAll();
              if (mounted) {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              }
            },
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }
}
