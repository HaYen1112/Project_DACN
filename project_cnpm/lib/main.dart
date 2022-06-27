import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project_cnpm/page/registration_page.dart';
import 'package:project_cnpm/page/ticketDetail.dart';


import 'package:project_cnpm/widget/navigation_drawer.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_cnpm/page/login.dart';
import 'package:project_cnpm/page/registPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions (
      apiKey: "AIzaSyAwVJhWKkce7_tcM_jvF0yRPqLswAtcUAc",
      appId: "1:672973814345:android:526e294bfc7169aa80dd98",
      messagingSenderId: "672973814345",
      projectId: "ticketbook-5235d",
    ) ,
  );
  runApp(MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  static const appTitle = 'TicketBook';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          if (snapshot.hasError){
            return Center(
              child: Text('Dang nhap khong thanh cong'),
            );
          }else{
            if (snapshot.hasData){
              if (snapshot.data?.email == 'projectticketbook@gmail.com'){
                return MainPageManager();
              }else{
                return MainPageCustomer();
              }
            }else{
              return Login();
            }
          }
        }
      },
    ),
  );
}


