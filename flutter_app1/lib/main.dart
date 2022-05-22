import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quản lý vé'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            color: Colors.indigoAccent,
            child: Text("$type", style: TextStyle(color: Colors.white, fontSize: 14)),
            onPressed: (){
              print("$type");
            },
          ),
        ),
        );
  }
}
