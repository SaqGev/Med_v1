import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gjhgjbkj/screens/details/my_camera/my_camera.dart';
import 'package:image_picker/image_picker.dart';

import '/screens/home/home_screen.dart';
import '/screens/profile_screen.dart';
import '../const.dart';

class MyBottomNavBar extends StatelessWidget {
  var cameras;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 90,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            padding: const EdgeInsets.only(
              top: 20,
            ),
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              );
            },
          ),
          IconButton(
            iconSize: 70,
            padding: const EdgeInsets.only(top: 10),
            icon: SvgPicture.asset("assets/icons/rec.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // ignore: missing_return
                  builder: (context) {
                    return MyCamera(
                      title: 'type of burn',
                    );
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user.svg"),
            iconSize: 35,
            padding: EdgeInsets.only(top: 15),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CameraStateClass extends State with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initController;
  var isCameraReady = false;
  late XFile imageFile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed)
      // ignore: curly_braces_in_flow_control_structures
      _initController =
          (_controller != null ? _controller.initialize() : null)!;
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
      scale: scale,
      child: CameraPreview(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [cameraWidget(context)],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// _getNavBar(context) {
// return Stack(
//   children: <Widget>[
//     Positioned(
//       bottom: 0,
//       child: ClipPath(
//       clipper: NavBarClipper(),
//       child: Container(
//       height: 30,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           kPrimaryColor,
//           kPrimarySecondColor,
//           ]
//         )
//       ),),
//     )),
//   Positioned(
//     bottom: 30,
//     width: MediaQuery.of(context).size.width,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children:<Widget> [
//       _buildNavItem(Icons.home_rounded, false),
//       SizedBox(width: 1),
//         _buildNavItem(Icons.camera, true),
//         SizedBox(width: 1),
//           _buildNavItem(Icons.person_rounded, false),
//       ],
//     ),
//   ),
//   Positioned(
//     bottom: 10,
//     width: MediaQuery.of(context).size.width,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     // crossAxisAlignment: CrossAxisAlignment,
//     children: <Widget>[
//       Text(
//         'Home',
//         style: TextStyle(
//         color: Colors.white.withOpacity(0.9),
//         fontWeight: FontWeight.w500,
//         ),
//       ),
//       SizedBox(
//         width: 1,
//       ),
//       Text(
//         'Camera',
//           style: TextStyle(
//           color: Colors.white.withOpacity(0.9),
//           fontWeight: FontWeight.w800,
//           ),
//         ),
//       SizedBox(
//         width: 1,
//       ),
//       Text(
//         'Profile',
//         style: TextStyle(
//         color: Colors.white.withOpacity(0.9),
//         fontWeight: FontWeight.w500,
//         ),
//       ),
//       SizedBox(
//         width: 1,
//       ),
//     ],
// ),
// )
// ],
// );
// }
// _buildNavItem(IconData icon, bool active){
// return CircleAvatar(
// radius: 30,
// backgroundColor: kPrimarySecondColor,
// child: CircleAvatar(
// radius: 25,
// backgroundColor: active? Colors.white.withOpacity(0.9) : Colors.transparent,
// child: Icon(
// icon,
// color: active? Colors.black : Colors.white.withOpacity(0.9),
// ),
// ),
// );
// }
//
//
// class NavBarClipper extends CustomClipper<Path> {
// @override
// Path getClip(Size size) {
// Path path = Path();
// var sw = size.width;
// var sh = size.height;
//
// path.cubicTo(sw/12,  0, sw/12, 2*sh/5, 2*sw/12, 2*sh/5);
// path.cubicTo(3*sw/12,  2*sh/5, 3*sw/12, 0, 4*sw/12, 0);
// path.cubicTo(5*sw/12,  0, 5*sw/12, 2*sh/5, 6*sw/12, 2*sh/5);
// path.cubicTo(7*sw/12,2*sh/5, 7*sw/12, 0, 8*sw/12, 0);
// path.cubicTo(9*sw/12,0, 9*sw/12, 2*sh/5, 10*sw/12, 2*sh/5);
// path.cubicTo(11*sw/12,2*sh/5,11*sw/12, 0, sw, 0);
// path.lineTo(sw, sh);
// path.lineTo(0, sh);
// path.close();
// return path;
// }
//
// @override
// bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

//   return Container(
//     padding: EdgeInsets.only(
//       left: kDefaultPadding,
//       right: kDefaultPadding,
//       bottom: kDefaultPadding,
//     ),
//     height: 80,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           offset: Offset(0, -10),
//           blurRadius: 90,
//           color: kPrimaryColor.withOpacity(0.38),
//         ),
//       ],
//     ),
//
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//
//         IconButton(
//           icon: SvgPicture.asset("assets/icons/home.svg"),
//           padding: EdgeInsets.only(top: 20,),
//           iconSize: 35,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return HomeScreen();
//                 },
//               ),
//             );
//           },
//         ),
//         IconButton(
//           iconSize: 70,
//           padding: EdgeInsets.only(top: 10),
//           icon: SvgPicture.asset("assets/icons/rec.svg"),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: SvgPicture.asset("assets/icons/user.svg"),
//           iconSize: 35,
//           padding: EdgeInsets.only(top: 15),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return ProfileScreen();
//                 },
//               ),
//             );
//           },
//         ),
//       ],
//     ),
//   );
// }}}
