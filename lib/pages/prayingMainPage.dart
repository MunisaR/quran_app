import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:quran_app/pages/praying/female/female_praying.dart';
import 'package:quran_app/pages/praying/male/male_praying.dart';

class PrayingMainPage extends StatefulWidget {
  const PrayingMainPage({Key? key}) : super(key: key);

  @override
  State<PrayingMainPage> createState() => _PrayingMainPageState();
}

class _PrayingMainPageState extends State<PrayingMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Namoz o'\qishni organamiz"),
        backgroundColor: primaryBg,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MalePraying()
                    ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(75),
                        child: Image.asset(
                          'assets/icons/praying_male.jpg',
                          height: 250.0,
                          width: 250.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Muslim",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MalePraying()
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(75),
                        child: Image.asset(
                          'assets/icons/praying_female.jpg',
                          height: 150.0,
                          width: 100.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Muslima",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
