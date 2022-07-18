import 'dart:js';
import 'package:flutter/material.dart';
class Tickets {
  final String startTime;
  final String endTime;
  final String date;
  final String startAddress;
  final String endAddress;
  final String status;
  final int price;
  final String seatLocation;
  final String amountOfTime;


  Tickets({
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.endAddress,
    required this.startAddress,
    required this.price,
    required this.amountOfTime,
    required this.seatLocation,
    required this.status
  });
  static Tickets fromJson(Map<String, dynamic> json) => Tickets(
    startAddress: json['startAddress'],
    endAddress: json['endAddress'],
    date: json['date'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    price: json['price'],
    amountOfTime: json['amountOfTime'],
    status: json['status'],
    seatLocation: json['seatLocation'],
  );
  Map<String, dynamic> toJson() => {
    'startAddress': startAddress,
    'endAddress': endAddress,
    'date': date,
    'startTime': startTime,
    'endTime': endTime,
    'price': price,
    'amountOfTime': amountOfTime,
    'status':status,
    'seatLocation': seatLocation

  };
}