import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controllerstate extends GetxController {
  updatestate() {
    update();
  }

  final TextEditingController _loginusername = TextEditingController();
  TextEditingController get loginusername => _loginusername;
  final TextEditingController _loginPassword = TextEditingController();
  TextEditingController get loginPassword => _loginPassword;

  final TextEditingController _signupfirstname = TextEditingController();
  TextEditingController get signupfirstname => _signupfirstname;
  final TextEditingController _signuplastname = TextEditingController();
  TextEditingController get signuplastname => _signuplastname;
  final TextEditingController _signupphoneno = TextEditingController();
  TextEditingController get signupphoneno => _signupphoneno;

  final TextEditingController _signupusername = TextEditingController();
  TextEditingController get signupusername => _signupusername;
  final TextEditingController _signupPassword = TextEditingController();
  TextEditingController get signupPassword => _signupPassword;
}
