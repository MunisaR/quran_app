import 'package:flutter/material.dart';
import 'package:quran_app/utils/categories.dart';
import 'package:quran_app/widgets/circle_card.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = route_categories;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CircleCard(customIcon: categories[index]['picture'], text:categories[index]['name'] ,);
      },
    );
    ////

  }
}
