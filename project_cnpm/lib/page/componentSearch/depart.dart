
import 'package:flutter/material.dart';
import 'dart:async';
class Depart extends StatefulWidget {
  const Depart({Key? key}) : super(key: key);

  @override
  State<Depart> createState() => _DepartState();
}

class _DepartState extends State<Depart> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String country_id ="";
  List<String> country = [
    "America",
    "Brazil",
    "Canada",
    "India",
    "Mongalia",
    "USA",
    "China",
    "Russia",
    "Germany"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      padding: EdgeInsets.all(0.5),
      child: DropdownButton(
        underline: SizedBox(),
        focusColor: Colors.green,
        value: country_id,
        isExpanded: true,
        hint: Text("Chọn điểm khởi hành"),
        onChanged: (newValue){
          setState((){
            // country_id = newValue;
          });
        },
        items: country.map((newValue){
          return DropdownMenuItem(
            value: newValue,
            child: Text(newValue),
          );
        }).toList(),
      ),
    )
    ;
  }


}
