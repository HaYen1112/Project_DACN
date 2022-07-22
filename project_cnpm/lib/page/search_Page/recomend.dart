import 'package:flutter/material.dart';

import '../TicketBook.dart';
import 'constants.dart';


class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(

            child: RecomendPlantCard(
              image: 'nhatrang.jpg',
              title: "Sài Gòn",
              country: "Đà Lạt",
              price: 280000,
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetailsScreen(),
                //   ),
                // );
              },
            ),
          ),
          Container(

            child: RecomendPlantCard(
              image: 'nhatrang.jpg',
              title: "Sài Gòn",
              country: "Nha Trang",
              price: 235000,
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetailsScreen(),
                //   ),
                // );
              },
            ),
          ),
          Container(

            child: RecomendPlantCard(
              image: 'nhatrang.jpg',
              title: "Sài Gòn",
              country: "Đà Nẵng",
              price: 390000,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String? image, title, country;
  final int? price;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image!),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  TicketBook('KjH86emQrhP5vwjtjG4u')));
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Text(
                    '    $price Đồng',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.red),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
