import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class Splash extends StatelessWidget {
  SplashController _splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: BoxDecoration(
              image:
                  DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/register/splash.png")),
              // gradient: LinearGradient(
              //     begin: Alignment.bottomCenter,
              //     end: Alignment.topCenter,
              //     colors: [
              //       // Color.fromARGB(255, 118, 253, 125),
              //       Color.fromARGB(255, 104, 207, 107),
              //       Color.fromARGB(255, 232, 255, 232)
              //     ])
            ),
          ),
        ),
      ),
    );
  }
}
