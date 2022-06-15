// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_cnpm/page/componentSearch/typeOfType.dart';

import 'constants.dart';
import 'depart.dart';
import 'destination.dart';
import 'ngayDi.dart';
import 'ngayVe.dart';
class HeaderWithSearchBox extends StatelessWidget {
   HeaderWithSearchBox({Key? key,  required this.size}) : super(key: key);
   final Size size;

  get press => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.2+280,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 50 + kDefaultPadding,
            ),
            height: size.height * 0.2 ,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              image: DecorationImage(
                image: AssetImage("img.png"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(36),
              //   bottomRight: Radius.circular(36),
              // ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'TÌM TUYẾN XE'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                // Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 108,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.8, 0.8, 0.8, 2),
                    child: Container(
                        width: 350,
                        child: Depart()
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    height: 1,
                    width: 350,
                  ),
                  Container(
                      width: 350,
                      child: Destinate()
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 108,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TypeOfTicker(),
                  Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            width: 250,
                            child: NgayDi(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 60,
                          width: 250,

                        ),
                      ),
                      Container(
                        height: 60,
                        width: 40,
                        child: Image.asset("calendar.png"),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 60,
                          width: 250,

                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            width: 250,
                            child: NgayVe(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 100,
            left: -8,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 110,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Container(
                child: Container(
                    height: 70,
                    width: 70,
                    child: Image.asset("vecto.png")),
              ),
            ),
          ),
          Positioned(
            top: 115,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Container(
                child: Container(
                    height: 80,
                    width: 80,
                    child: Image.asset("re.png")),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 40,
              child:Container(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  onPressed: press,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: SvgPicture.asset("search.svg"),
                      ),
                      Text(
                        "Tìm kiếm",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
