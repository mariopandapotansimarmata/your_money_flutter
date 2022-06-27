// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports, avoid_unnecessary_containers

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:your_money/home_page_list/list_transaction/heading_list.dart';
import 'package:your_money/home_page_list/list_transaction/list_main.dart';
import 'package:your_money/home_page_list/list_transaction/tiles_list_transaction.dart';
import 'package:your_money/profile_account/profile_acc_main.dart';
import 'package:your_money/transaction_form/transaction_input_form.dart';
import 'package:your_money/home_page_list/list_transaction/list.dart';
import 'package:your_money/transaction_form/transaction_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pages = [ListMain(), TransactionMain(), ProfileMain()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[300],
      body: SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) => setState(() => currentIndex = value),
          index: currentIndex,
          backgroundColor: Color.fromRGBO(100, 181, 246, 1),
          animationDuration: Duration(milliseconds: 200),
          items: [
            Icon(Icons.home),
            Icon(Icons.add),
            Icon(Icons.person),
          ]),
    );
  }
}
