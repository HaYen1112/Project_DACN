
import 'package:flutter/material.dart';

import '../page/TicketBook.dart';

class TicketBook_item extends StatelessWidget{
  late String title;
  late String status;
  late Color color = Colors.green;
   TicketBook_item(this.title,  this.status);
  @override
  Widget build(BuildContext context) {
    if (status != "Trống") {
      color = Colors.black26;
    }
    return Container(
       //padding: const EdgeInsets.all(20),
      child: ElevatedButton(
          onPressed: () {
          },
          style: ButtonStyle(
          //  foregroundColor: getColor(color, Colors.amberAccent),
            backgroundColor: getColor(color, Colors.amberAccent),
            side: getBorder(Colors.black12, color)
          ),

          child: Text('$title \n$status')),
        );
  }
  late bool isSelect=true;
  MaterialStateProperty<Color> getColor(Color color, Color color1){
    final getColors = (Set<MaterialState> state){
      if ((state.contains(MaterialState.pressed))&(status!='Đã đặt')){
        if(isSelect==true){
          color=color1;
          TicketBook.listId.add(title);
          isSelect=false;
        }else {
          color = Colors.green;
          TicketBook.listId.remove(title);
          isSelect = true;
        }
        return color1;
      }else{
        return color;
      }
    };
     return MaterialStateProperty.resolveWith((getColors));
  }
  MaterialStateProperty<BorderSide> getBorder(Color color, Color color1){
    final getBorder = (Set<MaterialState> state){
      if (state.contains(MaterialState.pressed)){
        return BorderSide(color: color1, width: 1);
      }else{
        return BorderSide(color: color, width: 1);
      }
    };
    return MaterialStateProperty.resolveWith((getBorder));
  }
}
