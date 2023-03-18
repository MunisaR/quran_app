import 'package:flutter/material.dart';
import 'package:quran_app/utils/categories.dart';
import 'package:quran_app/widgets/circle_card.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = routeCategories;
    // print(MediaQuery.of(context).size.height);
    return Container(
        height: MediaQuery.of(context).size.height <= 670 ? 460: 470,
        width: 430,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width <= 375 ? 2 : 3,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CircleCard(
              customIcon: categories[index]['picture'],
              text: categories[index]['name'],
              route: categories[index]['route'] as Widget,
            );
          },
        ));
  }
}
