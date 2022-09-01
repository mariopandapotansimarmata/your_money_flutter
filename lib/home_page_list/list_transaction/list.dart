// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final userid = FirebaseAuth.instance.currentUser?.uid.toString();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("transaction")
      .snapshots();

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
          child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                final data = snapshot.requireData;

                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, userid) {
                      return ListTransaction(
                          amount: data.docs[userid]['amount'],
                          category: data.docs[userid]['category'],
                          date: data.docs[userid]['date'],
                          note: data.docs[userid]['note'],
                          title: data.docs[userid]['title']);
                    });
              }),
        ),
      ),
    ));
  }
}
