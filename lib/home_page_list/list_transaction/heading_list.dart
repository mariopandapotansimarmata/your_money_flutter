// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HeadingList extends StatefulWidget {
  const HeadingList({Key? key}) : super(key: key);

  @override
  State<HeadingList> createState() => _HeadingListState();
}

class _HeadingListState extends State<HeadingList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "My Wallet",
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
