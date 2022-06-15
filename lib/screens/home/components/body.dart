import 'package:flutter/material.dart';
import 'package:gjhgjbkj/screens/home/components/recomended_plant.dart';

import '/const.dart';
import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithCustomUnderline(text: "Types"),
          RecomendsPlants(),
          TitleWithCustomUnderline(text: "First Aid"),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
