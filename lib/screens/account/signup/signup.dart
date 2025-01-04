import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandala_app/controller/controller.dart';
import 'package:mandala_app/reusable/reusablebtn.dart';
import 'package:mandala_app/reusable/reusabletextfield.dart';

import '../../../googleservice/firebase_services.dart';
import '../../homepage/homepage.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  bool? checkboxvalue = false;
  Controllerstate controller = Get.put(Controllerstate());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<Controllerstate>(builder: (_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    title: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        // fit: BoxFit.fitWidth,
                        image: AssetImage("assets/register/signup.png")),
                  ),
                ),
                reusableTextieldwithouticon("First Name*", false,
                    controller.signupfirstname, TextInputType.name),
                reusableTextieldwithouticon("Last Name*", false,
                    controller.signuplastname, TextInputType.name),
                reusableTextieldwithouticon("Mobile Number*", false,
                    controller.signupphoneno, TextInputType.name),
                reusableTextieldwithouticon("E-mail Address*", false,
                    controller.signupusername, TextInputType.name),
                reusableTextieldwithouticon("Password*", true,
                    controller.signupPassword, TextInputType.name),
                ListTile(
                  leading: Checkbox(
                      value: checkboxvalue,
                      onChanged: (bool? value) {
                        controller.updatestate();
                        checkboxvalue = value;
                        controller.updatestate();
                      }),
                  title: Text("I accept all terms and conditions"),
                ),
                reusablegridentcolorbtn(context, 0.80, "Sign Up", 18, () {
                  if (_formkey.currentState!.validate()) {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: controller.signupusername.text,
                            password: controller.signupPassword.text)
                        .then((value) {
                      Get.to(Home());
                    }).onError((error, stackTrace) {
                      if (error.toString() == "firebase_auth/email-already-in-use") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Already Email is Used")));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                      print("error${error.toString()}");
                    });
                  }
                  controller.signupfirstname.clear();
                  controller.signuplastname.clear();
                  controller.signupusername.clear();
                  controller.signupphoneno.clear();
                  controller.signupPassword.clear();
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "or",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/register/fb.png"),
                      InkWell(
                          onTap: () async {
                            await FirebaseServices().signInWithGoogle();

                            Get.to(Home());
                          },
                          child: Image.asset("assets/register/gmail.png"))
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      }),
    );
  }
}
