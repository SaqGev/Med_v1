import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/components/my_bottom_nav_bar.dart';
import '/const.dart';
import '/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.5),
        ),
        leading: const Icon(
          Icons.menu,
          color: kBackgroundColor,
        ),
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     children:<Widget> [
      //       DrawerHeader(
      //           decoration: BoxDecoration(
      //               gradient: LinearGradient(
      //                   colors: <Color>[
      //                     kPrimaryColor,
      //                     kPrimarySecondColor
      //                   ]
      //               )
      //           ) ,
      // //
      //           child: Container(
      //             child: Column(
      //               children:<Widget> [
      //                 Material(
      //                   borderRadius: BorderRadius.all(Radius.circular(100.0)) ,
      //                   child: Padding(
      //                     padding: EdgeInsets.all(8.0),
      //                     child: Icon(Icons.person_rounded, color: kPrimaryColor,size: 100,)
      //                   ),
      //                 )
      //               ],
      //             ),
      //           )),
      //       CustomListTile(Icons.info_outline_rounded, "About Burns",() => {}),
      //       CustomListTile(Icons.info_outlined, "About Programme",() => {}),
      //     ],
      //   ),
      // ),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

// AppBar buildAppBar() {
//   return Scaffold(
//     appBar: AppBar(
//       elevation: 0,
//       leading: IconButton(
//         icon: SvgPicture.asset("assets/icons/menu.svg"),
//         onPressed: (){}
//       ),
//     ),
//   );
// }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;

  CustomListTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: kPrimaryColor,
          onTap: () {},
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(icon, color: kPrimarySecondColor),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      style:
                          TextStyle(fontSize: 20.0, color: kPrimarySecondColor),
                    ),
                  ),
                ]),
                Icon(
                  Icons.arrow_right,
                  color: kPrimarySecondColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
