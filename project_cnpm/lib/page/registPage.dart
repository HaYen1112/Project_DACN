import 'package:flutter/material.dart';
class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        iconTheme: IconThemeData(color: Color(0xff3277D8)),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              SizedBox(
                height: 80,
              ),
              Image.asset('name'),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                  child: Text("Wellcome Aboard",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  )
              ),
              Text("Signup with iCab in simple steps",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black45),
                decoration: InputDecoration(labelText: "Name",
                prefixIcon:  Container(
                  width: 50, child: Image.asset("name")
                ),
                  border:  OutlineInputBorder(
                    borderSide:
                      BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                )
               ),
              ),

              TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                  decoration: InputDecoration(labelText: "Phone Number",
                    prefixIcon:  Container(
                        width: 50, child: Image.asset("name")
                    ),
                    border:  OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,20),
                child: TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                    decoration: InputDecoration(labelText: "Password",
                      prefixIcon:  Container(
                          width: 50, child: Image.asset("name")
                      ),
                      border:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                    )
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                    decoration: InputDecoration(labelText: "Email",
                      prefixIcon:  Container(
                          width: 50, child: Image.asset("name")
                      ),
                      border:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                    )
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: RichText(
                text: TextSpan(
                  text: "Already a User?",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  children: <TextSpan> [
                    TextSpan(
                      text: "Login now",
                      style: TextStyle(color: Colors.blue, fontSize: 16)
                    )
                  ]
                ),
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
