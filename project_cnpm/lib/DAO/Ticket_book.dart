import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Ticket_book{
  final String id;
  final String title;
  final String status;
  final Color color;

 const Ticket_book({required this.id,required this.title,required this.status,  this.color= Colors.black12});

}