import 'package:flutter/material.dart';
import 'package:quran_app/widgets/card.dart';
import 'package:quran_app/widgets/circle_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomCard(surahName: "An-Nasr", cardContent: "verse goes here...",),


            ],
          ),
        ),
      ),
    );
  }
}
