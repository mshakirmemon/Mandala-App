import 'package:flutter/material.dart';

Padding reusablegridentcolorbtn(BuildContext context, double width,
    String btntext, double txtsize, Function ontap) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  // Color.fromARGB(255, 118, 253, 125),
                  Color.fromARGB(255, 140, 1, 165),
                  // Colors.purple,
                  Color.fromARGB(255, 240, 0, 188),
                ])),
        child: Center(
          child: Text(
            btntext,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: txtsize,
                color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Padding reusablebtngreen(BuildContext context, double width, String btntext,
    double txtsize, Function ontap) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.green),
        child: Center(
          child: Text(
            btntext,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: txtsize,
                color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
