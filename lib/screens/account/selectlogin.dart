import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandala_app/reusable/reusablebtn.dart';
import 'package:mandala_app/screens/account/login/login.dart';
import 'package:mandala_app/screens/account/signup/signup.dart';

class SelectLogin extends StatelessWidget {
  const SelectLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: main,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/register/splash.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            reusablegridentcolorbtn(context, 0.80, "Sign in", 18, () {Get.to(Login());}),
            reusablebtngreen(context, 0.80, "Sign Up", 18, () {
              Get.to(Signup());
            })
          ],
        ),
      ),
    );
  }
}
