import 'package:flutter/material.dart';
class TypeOfTicker extends StatefulWidget {

  @override
  State<TypeOfTicker> createState() => _TypeOfTickerState();
}

class _TypeOfTickerState extends State<TypeOfTicker> {
  int? _set = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            color: Colors.white,
            height: 40,
            width: 250,
            child: ListTile(
              title: const Text("Một chiều"),
              leading: Radio<int>(
                value: 1,
                groupValue: _set,
                onChanged: (newValue){
                  setState((){
                    _set = newValue;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey,
          height: 40,
          width: 1,
        ),

        Expanded(
          child: Container(
            color: Colors.white,
            height: 40,
            width: 250,

            child: Padding(
              padding: const EdgeInsets.fromLTRB(40,0,0,0),
              child: ListTile(
                title: const Text("Khứ hồi"),
                leading: Radio<int>(
                  value: 2,
                  groupValue: _set,
                  onChanged: (newValue){
                    setState((){
                      _set = newValue;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
