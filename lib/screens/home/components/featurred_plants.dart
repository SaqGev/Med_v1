import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../recomended_onclick_page.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            image: "assets/images/feautured0.png",
            title: ("First aid for burns"),
            press: () {},
          ),
          FeaturePlantCard(
            image: "assets/images/feautured1.png",
            title: ("Necessary tools"),
            press: () {
              BodyLayout();
            },
          ),
        ],
      ),
    );
  }
}

// class FeaturePlantCard extends StatelessWidget {
//   const FeaturePlantCard(this.image, this.this.press):super(key: key);
//   final String image;
//   final Function press;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         margin: EdgeInsets.only(
//           left: kDefaultPadding,
//           top: kDefaultPadding / 2,
//           bottom: kDefaultPadding / 2,
//         ),
//         width: size.width * 0.8,
//         height: 185,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage(image),
//           ),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0,10),
//               blurRadius: 50,
//               color: kPrimaryColor.withOpacity(0.23),
//             ),
//           ],
//         ),
//         child: Row(
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "$title\n".toUpperCase(),
//                     style: Theme.of(context).textTheme.button),
//
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
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
        bottom: kDefaultPadding * 2,
      ),
      width: size.width * 0.45,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding:
                  EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 500,
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
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
