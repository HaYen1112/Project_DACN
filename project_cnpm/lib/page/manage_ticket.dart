import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

class ManageTicket extends StatefulWidget {
  @override
  State<ManageTicket> createState() => _ManageTicketState();
}

class _ManageTicketState extends State<ManageTicket> {
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
          Padding(padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionBtn("Thêm vé"),
                _actionBtn("Xóa vé"),
                _actionBtn("Cập nhật"),
              ],
            ),
          ),
        ],
      ),

    );
  }
  Widget _actionBtn(String type){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Color.fromARGB(255, 0, 181, 227),

          child: Text("$type", style: TextStyle(color: Colors.white, fontSize: 14, height: 3)),
          onPressed: (){
            print("$type");
          },
        ),
      ),
    );
  }
}