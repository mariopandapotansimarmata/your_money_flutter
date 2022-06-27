// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  int currentIndex = 1;
  String date = "Date";

  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.title),
                          border: InputBorder.none,
                          hintText: "Title"),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.grey[50],
              //         border: Border.all(color: Colors.white),
              //         borderRadius: BorderRadius.circular(15)),
              //      child:drop
              //      //Padding(
              //     //   padding: const EdgeInsets.only(left: 5.0),
              //     //   child: TextField(
              //     //     decoration: InputDecoration(
              //     //         prefixIcon: Icon(Icons.grid_on),
              //     //         border: InputBorder.none,
              //     //         hintText: "Category"),
              //     //   ),
              //     // ),
              //   ),
              // ),
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
                          selectDate = value;
                          date = value.toString();
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
                onPressed: () {},
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
