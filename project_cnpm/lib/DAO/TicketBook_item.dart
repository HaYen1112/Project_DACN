
import 'package:flutter/material.dart';

class TicketBook_item extends StatelessWidget{
  late String title;
  late String status;
  late Color color = Colors.green;
   TicketBook_item(this.title,  this.status);
  @override
  Widget build(BuildContext context) {
    if (status != "Trống") {
      color = Colors.deepOrange;
    }
    return Container(
       //padding: const EdgeInsets.all(20),
      child: ElevatedButton(
          onPressed: () {
          },
          style: ButtonStyle(
          //  foregroundColor: getColor(color, Colors.amberAccent),
            backgroundColor: getColor(color, Colors.amberAccent),
          ),

          child: Text('$title \n$status')),
        );
  }
  late bool isSelect=true;
  MaterialStateProperty<Color> getColor(Color color, Color color1){
    final getColors = (Set<MaterialState> state){
      if (state.contains(MaterialState.pressed)){
        if(isSelect==true){
          color=color1;
          isSelect=false;
        }else {
          color = Colors.green;
          isSelect = true;
        }
        return color1;
      }else{
        return color;
      }
    };
     return MaterialStateProperty.resolveWith((getColors));
  }
}
