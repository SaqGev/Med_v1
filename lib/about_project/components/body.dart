import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  // return Background(
  //   child: Scaffold(
  //     appBar: AppBar(
  //       title: Text("Our program can help you!"),
  //       backgroundColor: kBackgroundColor,
  //     ),
  //       body: SingleChildScrollView(
  //     child: Column(
  //       children: <Widget> [
  //         TextButton(
  //
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) {
  //                   return DrawerScreen();
  //               },
  //             ),
  //           );
  //         },
  //           child: Row(
  //             children: <Widget> [
  //               Text("next"),
  //
  //               Image.asset("assets/icons/back_arrow.svg")
  //             ],
  //           ),
  //
  //       ),
  //     ]
  //   ),
  // ),
  // ),
  // );

  // return Scaffold(
  //   appBar: AppBar(
  //     title: Text("Our program can help you!"),
  //     backgroundColor: kBackgroundColor,
  //   ),
  //   body: SingleChildScrollView(
  //     child: Column(
  //       children: <Widget> [
  //         TextButton(
  //
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) {
  //                   return HomeScreen();
  //               },
  //             ),
  //           );
  //         },
  //           child: Row(
  //             children: <Widget> [
  //               Text("next"),
  //
  // //               Image.asset("assets/icons/back_arrow.svg")
  //             ],
  //           ),
  //
  //               ),

  // Container(
  //   height: 737,
  //   child: Swiper(
  //     itemCount: 4,
  //     itemBuilder:(BuildContext context, int index){
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(0),
  //         child: Image (
  //           image: AssetImage(
  //               images4[index]
  //           ),
  //           fit: BoxFit.fitHeight,
  //         ),
  //       );
  //     },
  //     viewportFraction: 1,
  //     scale: 1,
  //     pagination: SwiperPagination(
  //       margin: const EdgeInsets.only(bottom: 250),
  //     ),
  //   ),
  // )
  //       ],
  //     ),
  //   ),
  // );
}
