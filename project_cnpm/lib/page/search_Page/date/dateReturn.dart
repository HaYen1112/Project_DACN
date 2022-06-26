import 'package:flutter/material.dart';
class NgayVe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Positioned(
            left: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 5),
              child: Text("Ngày về",
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
                const Expanded(
                    child: Text("12",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    )
                ),
                Expanded(child: Column(
                  children: const [
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
