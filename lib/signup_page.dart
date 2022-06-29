// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:your_money/auth_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
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
              ElevatedButton(
                onPressed: () async {
                  if (FirebaseAuth.instance.currentUser == null) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                    } on FirebaseAuthException catch (e) {
                      showNotification(context, e.message.toString());
                    }
                  } else {
                    await FirebaseAuth.instance.signOut();
                  }

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const HomePage()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0))),
                child: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.userChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return const Text("Sign Out");
                      } else {
                        return Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              //-- Not a member yet ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account? "),
                  GestureDetector(
                    onTap: () {},
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
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString()),
    ));
  }
}
