// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListTransaction extends StatefulWidget {
  const ListTransaction({Key? key}) : super(key: key);

  @override
  State<ListTransaction> createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> {
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
              Row(
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
                      "KFC",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Food",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ]),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Rp. 50.000",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("17/8/2022")
                ],
              ),
            ],
          )),
    );
  }
}
