// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:your_money/header_app.dart';
import 'package:your_money/transaction_form/heading_transaction.dart';
import 'package:your_money/transaction_form/transaction_input_form.dart';

class TransactionMain extends StatefulWidget {
  const TransactionMain({Key? key}) : super(key: key);

  @override
  State<TransactionMain> createState() => _TransactionMainState();
}

class _TransactionMainState extends State<TransactionMain> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: HeaderApp(
                    text1: "Add Transaction",
                    text2: '',
                  )),
            ],
          ),
          TransactionForm()
        ],
      ),
    );
  }
}
