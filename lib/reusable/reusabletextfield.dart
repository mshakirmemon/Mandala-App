import 'package:flutter/material.dart';

Padding reusableTextieldwithouticon(String text, bool isPasswordType,
    TextEditingController controller, TextInputType texttype) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 25, right: 25),
    child: TextFormField(
        validator: (value) {
          if (value!.length == 0) {
            return "Please Enter the $text";
          } else {
            return null;
          }
        },
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: isPasswordType,
        autocorrect: isPasswordType,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
        ),
        keyboardType: texttype,
        decoration: InputDecoration(
            labelText: text,
            hintText: text,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Color.fromARGB(255, 238, 236, 236),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0, style: BorderStyle.none)))),
  );
}
