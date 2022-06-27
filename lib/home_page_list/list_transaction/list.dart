// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:your_money/home_page_list/list_transaction/tiles_list_transaction.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Icon(
                    Icons.more_horiz_sharp,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(height: 20),
              //List View
              ListTransaction(),
              ListTransaction(),
              ListTransaction(),
              ListTransaction(),
              ListTransaction(),
              ListTransaction(),
              ListTransaction(),
            ]),
          ),
        ),
      ),
    );
  }
}
