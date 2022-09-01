// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:your_money/header_app.dart';
import 'package:your_money/home_page_list/list_transaction/list.dart';
import 'package:your_money/home_page_list/list_transaction/heading_list.dart';

class ListMain extends StatelessWidget {
  const ListMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: HeaderApp(text1: "My Wallet", text2: "")),
          ],
        ),
        List()
      ],
    );
  }
}
