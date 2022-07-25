
import 'package:flutter/material.dart';

import 'package:project_cnpm/page/login_register_forgotpassword/registration_page.dart';

import 'login.dart';

class AuthuPage extends StatefulWidget{
  @override
  _AuthPageState createState() => _AuthPageState();
}
class _AuthPageState extends State<AuthuPage>{
  bool isLogin = true;
  
  @override
  Widget build(BuildContext context) =>
      isLogin ? Login(onClickedSignUp: toggle)
              : RegistrationPage(onClickedSignIn: toggle);
     void toggle() => setState(() => isLogin = !isLogin);
}