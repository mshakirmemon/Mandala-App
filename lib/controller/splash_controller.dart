import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandala_app/main.dart';

import '../screens/account/selectlogin.dart';
import '../splash/splash.dart';

class SplashController extends GetxController {
  int _myTimer = 0;
  int get myTimer => _myTimer;

  @override
  void onInit() {
    super.onInit();
    timerPlay();
  }

  timerPlay() {
    var _splashScreenTimer;
    _splashScreenTimer =
        new Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      _myTimer++;
      if (_myTimer == 3) {
        _splashScreenTimer.cancel();
        Get.to(WillPopScope(onWillPop: () async => false, child: SelectLogin()
            //
            // StreamBuilder<User?>(
            //     stream: FirebaseAuth.instance.authStateChanges(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            // return homepage();
            // }
            // return loginpage();
            // }))
            ));
      }
    });
  }
}
