import 'package:flutter/material.dart';
final messengerKey = GlobalKey<ScaffoldMessengerState>();
class Utils {
  static showSnackBar(String? text) async {
    if (text == null) return;
    // final translation = await text.tr(
    //   form: 'en',
    //   to: 'es'
    // );

    final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.amber,);
    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);

  }
}