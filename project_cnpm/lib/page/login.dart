
import 'dart:js';

import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/main.dart';
import 'package:project_cnpm/page/registration_page.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';
class Login extends StatelessWidget{
  final controllerEmail = TextEditingController();
  final controllerPW = TextEditingController();
  @override
  void dispose() {
    controllerPW.dispose();
    controllerEmail.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset('xe.png'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                    child: Text("Welcome back!",
                      style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                    ),
                  ),
                  Text("Login to continue using TicketBook",
                    style: TextStyle(fontSize: 14, color: Color(0xff333333) ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: TextField(
                      controller: controllerEmail,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Container(
                          height: 30,
                          width: 50, child: Image.asset("ic_mail.png")),
                        border: OutlineInputBorder(
                          borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))) ,
                    ),
                  ),
                  TextField(
                    controller: controllerPW,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Container(
                        height: 30,
                        width: 50, child: Image.asset("ic_pass.png")),
                      border: OutlineInputBorder(
                        borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                  ),
                  Container(
                    constraints: BoxConstraints.loose(Size(double.infinity,30)),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child:RaisedButton(
                        onPressed: signIn,
                        //     () {
                        //   final email = controllerEmail.text;
                        //   final password = controllerPW.text;
                        //   checkUser(email: email, password: password);
                        //   if (email == '1') {
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageCustomer()));
                        //   }else{
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageManager()));
                        //   }
                        // },

                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                        color: Color.fromARGB(205, 215, 162, 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: RichText(
                      text: TextSpan(
                        text: "New user?",
                        style: TextStyle(color: Color(0xff606470), fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                },
                            text: " Sign up for a new account",
                            style: TextStyle(
                              color: Color(0xff3277D8), fontSize: 16))
                        ]),
                    )
                  )
                ],
              )
            ),
          ),
        );
      }

  // Stream<List<Users>> readUsers() => FirebaseFirestore.instance
  //     .collection('user')
  //     .snapshots()
  //     .map((event) =>
  //         event.docs.map((doc) => Users.fromJson(doc.data())).toList());

  Future checkUser({required String email, required String password}) async {
    Stream<List<Users>> docUser = FirebaseFirestore.instance.collection('user')
        .snapshots()
        .map((event) => event.docs.map((doc) =>
      Users.fromJson(doc.data())).toList());
      docUser.toString();
  }
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPW.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      // Utils.showSnackBar(e.message);

    }
    navigatorKey.currentState!.popUntil((route) => true);
  }
 }