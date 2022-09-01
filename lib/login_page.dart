// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, implementation_imports, unused_import, avoid_web_libraries_in_flutter, use_build_context_synchronously

//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:your_money/home_page_list/home_page.dart';
import 'package:your_money/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //-- Logo
                Icon(
                  Icons.wallet_outlined,
                  size: 150,
                ),

                Text(
                  "Your Money",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                ),

                SizedBox(
                  height: 80,
                ),
                // StreamBuilder<User?>(
                //     stream: FirebaseAuth.instance.userChanges(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Text("Signed In ${snapshot.data?.email}");
                //       } else {
                //         return Text("You haven't SignIn yet");
                //       }
                //     }),
                //-- Email Text FIeld
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //-- password Texrfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Password"),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                //--sign in button
                StreamBuilder<User?>(
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const HomePage()),
                    // );
                    stream: FirebaseAuth.instance.userChanges(),
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                          } on FirebaseAuthException catch (e) {
                            showNotification(context, e.message.toString());
                          }

                          // if (snapshot.hasData) {
                          //   await Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()),
                          //   );
                          // } // else {
                          //   return Text("You haven't SignIn yet");
                          // }
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()),
                          //     (Route<dynamic> route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(250, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0))),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                //-- Not a member yet ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString()),
    ));
  }
}
