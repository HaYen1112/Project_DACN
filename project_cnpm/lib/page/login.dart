import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/main.dart';
import 'package:project_cnpm/page/forgot_passwork_page.dart';
import 'package:project_cnpm/page/registration_page.dart';
import 'package:project_cnpm/page/utils.dart';

class Login extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const Login({
    Key? key,
    required this.onClickedSignUp,
}): super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Image.asset('xe.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                  ),
                ),
                Text(
                  "Login to continue using TicketBook",
                  style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controllerEmail,
                    validator: (email) {
                      if (email?.length == 0) {
                        return "Vui lòng nhập email!";
                      } else {
                        if (!EmailValidator.validate(email!)) {
                          return "Email không hợp lệ";
                        }
                      }
                    },
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Container(
                            height: 30,
                            width: 50,
                            child: Image.asset("ic_mail.png")),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
                TextFormField(
                  controller: controllerPW,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val?.length == 0) {
                      return "Vui lòng nhập mật khẩu!";
                    }
                  },
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Container(
                          height: 30,
                          width: 50,
                          child: Image.asset("ic_pass.png")),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),
                ),
                Container(
                  constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Color(0xff606470), fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassworkPage()));
                                  },
                                text: "Forgot password?",
                                style: TextStyle(
                                    color: Color(0xff3277D8), fontSize: 16))
                          ]
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                    child: SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: RaisedButton(
                          onPressed: signIn,
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: RichText(
                      text: TextSpan(
                          text: "New user?",
                          style:
                              TextStyle(color: Color(0xff606470), fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignUp,
                                text: " Sign up for a new account",
                                style: TextStyle(
                                    color: Color(0xff3277D8), fontSize: 16))
                          ]
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(child: CircularProgressIndicator(),)
    // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPW.text.trim());
      final userDoc = FirebaseFirestore.instance.collection('users').doc(controllerEmail.text.trim());
      final snapshot = await userDoc.get();
      Users user = Users.fromJson(snapshot.data()!);
      if (user.password != controllerPW.text.trim()) {
        user.updatePassword(controllerPW.text.trim());
        userDoc.update(user.toJson());
      }

    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
