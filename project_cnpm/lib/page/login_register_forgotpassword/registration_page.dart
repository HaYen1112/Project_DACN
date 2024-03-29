
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/main.dart';
import 'package:project_cnpm/page/login_register_forgotpassword/utils.dart';
import '../../widget/header_widget.dart';
import '../../widget/theme_helper.dart';

class RegistrationPage extends StatefulWidget {
  final Function onClickedSignIn;
  const RegistrationPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final controllerEmail = TextEditingController();
  final controllerPW = TextEditingController();
  final controllerUserName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 80,
              child: HeaderWidget(80, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.amber,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextFormField(
                            controller: controllerUserName,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            validator: (user) {
                              if (user?.length == 0)
                                return "Vui lòng nhập Tên của bạn!";
                            },
                            decoration: InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controllerEmail,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "E-Mail Address",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) {
                              if (email?.length == 0) {
                                return "Vui lòng nhập email!";
                              } else {
                                if (!EmailValidator.validate(email!)) {
                                  return "Email không hợp lệ";
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controllerPhoneNumber,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Phone Number",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (val!.length == 0) {
                                return 'Vui lòng nhập số điện thoại!';
                              } else if (!regExp.hasMatch(val)) {
                                return 'Số điện thoại không hợp lệ';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextFormField(
                            controller: controllerAddress,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            validator: (user) {
                              if (user?.length == 0)
                                return "Vui lòng nhập địa chỉ!";
                            },
                            decoration: InputDecoration(
                                labelText: "Address",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controllerPW,
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            validator: (val) {
                              if (val?.length == 0) {
                                return "Vui lòng nhập mật khẩu!";
                              } else {
                                if ((val?.length)! < 6) {
                                  return "Nhập mật khẩu lớn hơn hoặc bằng 6 kí tự";
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      "Tôi đồng ý các điều khoản trên!",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'Bạn cần chấp nhận các điều khoản và điều kiện!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Container(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 52,
                                  child: RaisedButton(
                                    onPressed: () {
                                      final user = Users(
                                          name: controllerUserName.text,
                                          email: controllerEmail.text,
                                          phone: controllerPhoneNumber.text,
                                          address: controllerAddress.text,
                                          password: controllerPW.text
                                      );
                                      if (_formKey.currentState!.validate()) {
                                        register(user);
                                      }
                                    },
                                    child: Text("Resgister",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)
                                    ),
                                    color: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)
                                        )
                                    ),
                                  ))),
                        ),
                        SizedBox(height: 30.0),
                        // Text( "Do you have an accout?",  style: TextStyle(color: Colors.grey),),
                        // Text("Login"),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: RichText(
                              text: TextSpan(
                                  text: "Do you have an account?",
                                  style: TextStyle(
                                      color: Color(0xff606470), fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = widget.onClickedSignIn
                                              as GestureTapCallback?,
                                        text: " Sign up",
                                        style: TextStyle(
                                            color: Color(0xff3277D8),
                                            fontSize: 16))
                                  ]),
                            )),
                        SizedBox(height: 30.0),
                        Text(
                          "Or create account using social media",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus,
                                size: 35,
                                color: HexColor("#EC2D2F"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Google Plus",
                                          "You tap on GooglePlus social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 23,
                                  color: HexColor("#FFFFFF"),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Twitter",
                                          "You tap on Twitter social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                                color: HexColor("#3E529C"),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future register(Users user) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.email);
    final json = user.toJson();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPW.text.trim());
      await docUser.set(json);
    } on FirebaseAuthException catch (e) {
      print(e);

      // Utils.showSnackBar(e.message);

    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

