import 'package:flutter/material.dart';
class NgayDi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 5),
              child: Text("Ngày đi",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Text("12",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.lightBlue,
                      ),
                    )
                ),
                Expanded(child: Column(
                  children: [
                    Text("TH3",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Text("2021",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
