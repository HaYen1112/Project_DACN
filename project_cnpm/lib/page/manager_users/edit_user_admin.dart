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
import 'package:project_cnpm/page/manager_users/manager_user.dart';
import 'package:project_cnpm/page/login_register_forgotpassword/utils.dart';
import '../../widget/header_widget.dart';
import '../../widget/theme_helper.dart';

class EditUserPage extends StatefulWidget {
  String? idUser;

  EditUserPage({required this.idUser});

  @override
  State<StatefulWidget> createState() {
    return _EditUserPageState(idUser: idUser);
  }
}

class _EditUserPageState extends State<EditUserPage> {
  String? idUser;
  _EditUserPageState({required this.idUser});
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final controllerEmail = TextEditingController();
  final controllerPW = TextEditingController();
  final controllerUserName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerAddress = TextEditingController();
  late String? name;
  late String? address;
  late String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cập nhật tài khoản'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),

      body: SingleChildScrollView(
        child: StreamBuilder<Users>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              name = users.name;
              address = users.address;
              phone = users.phone;
              return Stack(
                children: [
                  Container(
                    height: 80,
                    child:
                    HeaderWidget(80, false, Icons.person_add_alt_1_rounded),
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
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 5, color: Colors.white),
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
                                      padding:
                                      EdgeInsets.fromLTRB(80, 80, 0, 0),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  validator: (user) {
                                    if (user?.length == 0) {
                                      return "Vui lòng nhập Tên của bạn!";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: "${users.name}",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffCED0D2),
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)))),
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller: controllerEmail,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  decoration: InputDecoration(
                                      enabled: false,
                                      labelText: "${users.email}",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffCED0D2),
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)))),
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
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller: controllerPhoneNumber,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  decoration: InputDecoration(
                                      labelText: "${users.phone}",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffCED0D2),
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)))),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (val) {
                                    String pattern =
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                    RegExp regExp = new RegExp(pattern);
                                    if (val!.length == 0) {
                                      return 'Vui lòng nhập số điện thoại!';
                                    } else if (!regExp.hasMatch(val)) {
                                      return 'Số điện thoại không hợp lệ';
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                child: TextFormField(
                                  controller: controllerAddress,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  validator: (val) {
                                    if (val?.length == 0) {
                                      return "Vui lòng nhập địa chỉ!";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: "${users.address}",
                                      hintText: address,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffCED0D2),
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)))),
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                child: Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 40),
                                    child: SizedBox(
                                        width: double.infinity,
                                        height: 52,
                                        child: RaisedButton(
                                          onPressed: () {
                                            final user = Users(
                                                name: (controllerUserName
                                                    .text !=
                                                    ''
                                                    ? controllerUserName.text
                                                    : '${users.name}'),
                                                email: users.email,
                                                phone: controllerPhoneNumber
                                                    .text !=
                                                    ''
                                                    ? controllerPhoneNumber.text
                                                    : users.phone,
                                                address:
                                                controllerAddress.text != ''
                                                    ? controllerAddress.text
                                                    : users.address,
                                                password:
                                                users.password.toString());
                                            update(user);
                                          },
                                          child: Text("Cập nhật",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          color: Colors.amber,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }



  Future update(Users user) async {
    final docUser =
    FirebaseFirestore.instance.collection('users').doc(user.email);
    final json = user.toJson();
    try {
      // await docUser.update(json);
      await docUser.update(json);
    } on FirebaseAuthException catch (e) {
      // print(e);
      // Utils.showSnackBar(e.message);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ManageUser()));
  }

  Stream<Users> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .doc(idUser)
      .snapshots()
      .map((event) => Users.fromJson(event.data()!));
}

