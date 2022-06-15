import 'package:flutter/material.dart';

import '../../../const.dart';

// class TitleWithMoreBtn extends StatelessWidget {
//   const TitleWithMoreBtn({
//     Key key,
//     this.title,
//     this.press,
//   }) : super(key: key);
//   final String title;
//   final Function press;
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
// //       child: Row(
// //         children: <Widget>[
// //           TitleWithCustomUnderline(text: title),
// //           Spacer(),
// //           FlatButton(
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(100),
// //             ),
// //             color: kPrimaryColor,
// //             onPressed: press,
// //             child: Text(
// //               "More",
// //               style: TextStyle(color: Colors.white),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// }

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4.5),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 2),
              height: 4,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
