import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/login_register_forgotpassword/utils.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';

class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail =false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? MainPageCustomer()
      : Scaffold(
          appBar: AppBar(
            title: Text('Verify Email'),
          ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Xác minh email đã được gửi đến email của bạn.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50)
            ),
              onPressed: (canResendEmail ? sendVerificationEmail :null),
              icon: Icon(Icons.email, size: 32,),
              label: Text(
                'Gửi lại email',
                style: TextStyle(fontSize: 24),
              )
          ),
          SizedBox(height: 8),
          TextButton(onPressed: ()=> FirebaseAuth.instance.signOut(),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 24)
              )
          )
        ],
      ),
    ),
        );
  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
   setState(() {
     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
   });
   if (isEmailVerified) timer?.cancel();
  }
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      setState(() => canResendEmail=false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail=true);
    } catch (e) {

     // Utils.showSnackBar(e.toString());

    }
  }
}
