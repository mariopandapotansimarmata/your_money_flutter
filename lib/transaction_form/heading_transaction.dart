// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HeadingTransaction extends StatefulWidget {
  const HeadingTransaction({Key? key}) : super(key: key);

  @override
  State<HeadingTransaction> createState() => _HeadingTransactionState();
}

class _HeadingTransactionState extends State<HeadingTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Add \nTransaction",
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
