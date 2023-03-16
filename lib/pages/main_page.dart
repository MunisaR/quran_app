import 'package:flutter/material.dart';
import 'package:quran_app/utils/categories.dart';
import 'package:quran_app/widgets/card.dart';
import 'package:quran_app/widgets/card_view.dart';
import 'package:quran_app/widgets/circle_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CustomCard(surahName: "An-Nasr", cardContent: "verse goes here...",),

              ],
            ),
          ),
          SingleChildScrollView(scrollDirection: Axis.vertical,
             child: CardView()
          )

        ],
      ),
    );
  }
}
