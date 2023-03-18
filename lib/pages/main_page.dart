import 'package:flutter/material.dart';
import 'package:quran_app/utils/categories.dart';
import 'package:quran_app/widgets/card.dart';
import 'package:quran_app/widgets/card_view.dart';
import 'package:quran_app/widgets/circle_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(

        child: Column(
          children: [
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CustomCard(surahName: "An-Nasr", cardContent: "1. (Эй Муҳаммад алайҳис-салоту вас-салом), айтинг: «У — Аллоҳ Бирдир. (Яъни, Унинг ҳеч қандай шериги йўқдир. У яккаю ёлғиздир).",),

                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SingleChildScrollView(scrollDirection: Axis.vertical,
               child: CardView()
            )

          ],
        ),
      ),
    );
  }
}
