import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/components/my_bottom_nav_bar.dart';
import '/const.dart';

class ProfileScreen extends StatelessWidget {
  void _launchCaller(int number) async {
    var num = "tel:${number.toString()}";
    if (await canLaunch(num)) {
      await launch(num);
    } else {
      throw 'Could not open calling option';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: kBackgroundColor, fontSize: 22),
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kPrimaryColor, kPrimarySecondColor])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://img.icons8.com/pastel-glyph/2x/person-male--v2.png",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "sargis@mangora.am",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: kBackgroundColor,
                        elevation: 0,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Your Pictures With Our Advices",
                                        style: TextStyle(
                                          color: kPrimarySecondColor,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: kPrimaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Your Pictures",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Text('My name is Alice and I am  a freelance mobile app developper.\n'
                  //     'if you need any mobile app for your company then contact me for more informations',
                  //   style: TextStyle(
                  //     fontSize: 22.0,
                  //     fontStyle: FontStyle.italic,
                  //     fontWeight: FontWeight.w300,
                  //     color: Colors.black,
                  //     letterSpacing: 2.0,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          //this is for the image and description CardView
          SizedBox(
            child: Card(
              shadowColor: kPrimaryColor,
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Type of Pic"),
                    subtitle: Text("Description of the First Aid"),
                    leading: Image.asset("assets/images/image2.png"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {
                  _launchCaller(911);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [kPrimaryColor, kPrimarySecondColor]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: kBackgroundColor,
                        ),
                        Text(
                          "Call to Emergency",
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
