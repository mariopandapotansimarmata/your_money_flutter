// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports, sort_child_properties_last
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  //final auth = FirebaseAuth.instance.currentUser;
  final userid = FirebaseAuth.instance.currentUser?.uid;
  //FirebaseDatabase database = FirebaseDatabase.instance;
  // final database = FirebaseDatabase.instance.refFromURL(
  //    'https://your-money-f8049-default-rtdb.asia-southeast1.firebasedatabase.app');
  // CollectionReference transaction = firestore.collection("collectionPath");
  int currentIndex = 1;
  String date = "Date";
  String selectedCategory = "Category";

  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    //  final transactionMoney = database.child('/transaction');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.monetization_on),
                          border: InputBorder.none,
                          hintText: "Amount"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.title),
                          border: InputBorder.none,
                          hintText: "Title"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(55, 0, 30, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          items: const [
                            DropdownMenuItem(
                              child: Text("Food"),
                              value: "Food",
                            ),
                            DropdownMenuItem(
                              child: Text("Transportation"),
                              value: "Transportation",
                            ),
                            DropdownMenuItem(
                              child: Text("House kit"),
                              value: "House kit",
                            ),
                            DropdownMenuItem(
                              child: Text("Entertainment"),
                              value: "Entertainment",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value.toString();
                            });
                          },
                          hint: Text(selectedCategory),
                          isExpanded: true,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                child: ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: selectDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          DateFormat('d/M/y').format(value);
                          selectDate = value;
                          date = DateFormat('d/M/y').format(value);
                        });
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[50],
                      minimumSize: Size(400, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0))),
                  child: Container(
                    child: Row(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.date_range,
                              color: Colors.grey[700],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "$date",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      controller: noteController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.notes),
                          border: InputBorder.none,
                          hintText: "Note"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    firestore
                        .collection("users")
                        .doc(userid)
                        .collection("transaction")
                        .add({
                      'amount': amountController.text,
                      'title': titleController.text,
                      'category': selectedCategory,
                      'date': date,
                      'note': noteController.text,
                    });
                    print(" Data written");
                  } catch (e) {
                    void showNotification(
                        BuildContext context, String message) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.orange.shade900,
                        content: Text(message.toString()),
                      ));
                    }
                  }
                  ;
                  amountController.text = "";
                  titleController.text = "";
                  selectedCategory = "";
                  date = "";
                  noteController.text = "";
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
