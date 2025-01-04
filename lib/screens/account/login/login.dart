import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandala_app/screens/homepage/homepage.dart';

import '../../../controller/controller.dart';
import '../../../googleservice/firebase_services.dart';
import '../../../reusable/reusablebtn.dart';
import '../../../reusable/reusabletextfield.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
                      "Sign In",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  wi
                ),
                reusableTextieldwithouticon("Email*", false,
                    controller.loginusername, TextInputType.name),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                reusableTextieldwithouticon("Password*", true,
                    controller.loginPassword, TextInputType.name),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ListTile(
                  leading: Checkbox(
                      value: checkboxvalue,
                      onChanged: (bool? value) {
                        controller.updatestate();
                        checkboxvalue = value;
                        controller.updatestate();
                      }),
                  title: Text("Remember Me"),
                  trailing: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 217, 0, 255)),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                reusablegridentcolorbtn(context, 0.80, "Sign In", 18, () {
                  if (_formkey.currentState!.validate()) {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: controller.loginusername.text,
                            password: controller.loginPassword.text)
                        .then((value) {
                      Get.to(Home());
                    }).onError((error, stackTrace) {
                      if (error.toString() == "firebase_auth/user-not-found") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("No user Found")));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                      print("error${error.toString()}");
                    });
                  }
                  controller.loginusername.clear();
                  controller.loginPassword.clear();
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
