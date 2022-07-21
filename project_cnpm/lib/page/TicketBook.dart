import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/TicketBook_item.dart';
import 'package:project_cnpm/DAO/TicketData.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

class TicketBook extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationManageDrawerWidget(),
    appBar: AppBar(
      title: Text('Đặt vé'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 248, 178, 29),

    ),
    body: GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_TICKET.map((ticketBook_item) => TicketBook_item(
          ticketBook_item.title,
          ticketBook_item.status,
          ticketBook_item.color)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
    ),
  );
}
