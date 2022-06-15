import 'package:flutter/material.dart';

import '../../../const.dart';

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
          RecomendPlantCard(
            image: "assets/images/image1.png",
            title: "Type 1",
            press: () {
              _openPopUpAboutTypes(context);
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image0.png",
            title: "Type 2",
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/image2.png",
            press: () {},
            title: 'Type 3',
          ),
        ],
      ),
    );
  }
}

void _openPopUpAboutTypes(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Type 1"),
    content: Text(
      "",
      style: TextStyle(fontSize: 11.0, fontStyle: FontStyle.italic),
    ),
  );
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;

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
          Image.asset(image),
          GestureDetector(
            onTap: () {},
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
                        // TextSpan(
                        //   text: "\$ country".toUpperCase(),
                        //   style: TextStyle(
                        //     color: kPrimaryColor.withOpacity(0.5),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Text(
                  //   '\$price',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .button
                  //       .copyWith(color: kPrimaryColor),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
