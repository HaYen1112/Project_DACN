import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/utils.dart';
class ForgotPassworkPage extends StatefulWidget{
  @override
  _ForgotPassworkPageState createState() => _ForgotPassworkPageState();
}
class _ForgotPassworkPageState extends State<ForgotPassworkPage>{
  final formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  @override
  void dispose() {
    emailControler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.amberAccent,
      elevation: 0,
      title: Text('Reset Password'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nhập email của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: emailControler,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
              email != null && !EmailValidator.validate(email)
              ? '!Enter a valid email'
              : null,
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(
                icon: Icon(Icons.email_outlined),
                label: Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(52),
                surfaceTintColor: Colors.amber,
                shadowColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(6)
                    )
                ),
              ),
              onPressed: () {
                  resetPassword();
              },

            )
          ],
        ),
      ),
    ),
  );
  Future resetPassword() async {
    showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator())
      );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailControler.text.trim());
      Utils.showSnackBar('Password reset email sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}