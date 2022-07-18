import 'dart:js';
import 'package:flutter/material.dart';
class Trips {
    final String startTime;
    final String endTime;
    final String date;
    final String startAddress;
    final String endAddress;
    final int quantityStatus;
    final int price;

    Trips({
      required this.startTime,
      required this.endTime,
      required this.date,
      required this.endAddress,
      required this.startAddress,
      required this.price,
      required this.quantityStatus,
});
    static Trips fromJson(Map<String, dynamic> json) => Trips(
      startAddress: json['startAddress'],
      endAddress: json['endAddress'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      price: json['price'],
      quantityStatus: json['quantityStatus'],

    );
    Map<String, dynamic> toJson() => {
      'startAddress': startAddress,
      'endAddress': endAddress,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'price': price,
      'quantityStatus': quantityStatus,

    };
}