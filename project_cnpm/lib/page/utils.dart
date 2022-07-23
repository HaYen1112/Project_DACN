import 'package:flutter/material.dart';
final messengerKey = GlobalKey<ScaffoldMessengerState>();
class Utils {
  static showSnackBar(String? text) async {
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.amber,);
    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);

  }
}