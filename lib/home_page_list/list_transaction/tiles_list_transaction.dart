// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListTransaction extends StatelessWidget {
  ListTransaction(
      {Key? key,
      required this.amount,
      required this.category,
      required this.date,
      required this.note,
      required this.title})
      : super(key: key);
  final String? amount;
  final String? category;
  final String? date;
  final String? note;
  final String? title;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                  stream: firestore.collection('users').snapshots(),
                  builder: (_, snapshots) {
                    if (snapshots.hasData) {}
                    return Row(
                      children: [
                        Icon(
                          Icons.food_bank,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(children: [
                          Text(
                            "$note",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$category",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ]),
                      ],
                    );
                  }),
              Column(
                children: [
                  Text(
                    "Rp $amount",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$date")
                ],
              ),
            ],
          )),
    );
  }
}
