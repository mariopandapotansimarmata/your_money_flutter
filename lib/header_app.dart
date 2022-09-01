// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$text1",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Text(
                  "Select Your Transaction Below",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
