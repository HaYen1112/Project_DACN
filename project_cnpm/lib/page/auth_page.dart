
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/login.dart';
import 'package:project_cnpm/page/registration_page.dart';

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