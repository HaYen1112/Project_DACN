import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/page/add_ticket_ad.dart';
import 'package:project_cnpm/page/edit_ticket_ad.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

class ManageTicket extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Quản lý vé'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Mã Vé',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)
                  )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  
                  Expanded(child: Padding(padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20))
                ),
                        child: Text("Thêm vé", style: TextStyle(color: Colors.white, fontSize: 14, height: 0)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>AddTicketAdmin()
                          ));
                        },
                      )
                  )
                  ),

                  Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20))
                        ),
                        child: Text("Xóa vé", style: TextStyle(color: Colors.white, fontSize: 14, height: 0)),
                        onPressed: () {},
                      )
                  )
                  ),

                  Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20))
                        ),

                        child: Text("Cập nhật", style: TextStyle(color: Colors.white, fontSize: 14, height: 0)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> EditTicketAdmin()
                        ));
                        },

                      )
                  )
                  )
                ]
              ),
            ),
        ],
      ),
    );
  }
}