import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:project_cnpm/widget/navigation_drawer.dart';
import 'dart:io';
class TicketDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(255, 248, 178, 29);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(color: primaryColor),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey[50],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 64,
            bottom: 16,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Thông tin vé đặt",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hồ Chí Minh",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                color: primaryColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Divider(
                                                color: primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(color: primaryColor)),
                                            child: Text(
                                              "11h 40m",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Đà Lạt",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Suối Tiên, Quận 9"),
                                Text("Bến xe Đà Lạt"),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "08:33",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("20, 6, 2022")
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "08:33",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("21, 6, 2022")
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 72,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CHÍ KHANG",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Khách hàng")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "0323253443",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Số điện thoại")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Số ghế")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "A01, A02",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Vị trí ghế ngồi")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "DWP42SX",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Mã vé")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "213534965",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Mã đặt vé")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trống",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Ghi chú")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "500.000",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Tổng tiền thanh toán")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Text("Đặt vé mới", style: TextStyle(fontSize: 20.0),),
                          color: Color.fromARGB(255, 248, 178, 29),
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text("Hủy vé", style: TextStyle(fontSize: 20.0),),
                          color: Colors.grey,
                          textColor: Colors.white,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context)=>AlertDialog(
                                  title: const Text("Xác nhận hủy vé?"),
                                  content: const Text("Thao tác này sẽ hủy vé đã đặt của bạn."),
                                  actions: [
                                    TextButton(child: const Text("Hủy vé"),
                                      onPressed: (){Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(child: const Text("Xác nhận"),
                                      onPressed: (){
                                        showDialog(
                                            context: context,
                                            builder: (context)=>AlertDialog(
                                              title: const Text("Thông báo"),
                                              content: const Text("Vé đã được hủy."),
                                              actions: [
                                                TextButton(child: const Text("Ok"),
                                                  onPressed: (){
                                                  },
                                                ),
                                              ],
                                            )
                                        );
                                      },
                                    )
                                  ],
                                )
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: primaryColor,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: primaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
