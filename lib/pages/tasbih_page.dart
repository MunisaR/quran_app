import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:vibration/vibration.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({Key? key}) : super(key: key);

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  var totalCount = 0;
  var count = 0;
  var iteration = 1;

  void reset() {
    setState(() {
      count = 0;
      Vibration.vibrate(duration: 100);
    });
  }

  String dhikr = 'Subhanalloh';

  void increase() {
    setState(() {
      totalCount += 1;
    });
    setState(() {
      if (count <= 32) {
        count += 1;
      } else if (count == 33) {
        count = 0;
        Vibration.vibrate(duration: 300);

        if (iteration <= 4) {
          iteration += 1;
          if (iteration > 5) {
            totalCount = 0;
          }
        } else {
          iteration = 1;
        }
      }
    });

    if (iteration == 1) {
      setState(() {
        dhikr = "Subhanalloh";
      });
    } else if (iteration == 2) {
      setState(() {
        dhikr = "Alhamdulillah";
      });
    } else if (iteration == 3) {
      dhikr = 'Allohu Akbar';
    } else if (iteration == 4) {
      dhikr = 'La ilaha Illaloh';
    } else if (iteration == 5) {
      dhikr = 'Subhanallohi wa \nbihamdihi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/mosque2.png"),
                alignment: Alignment.bottomCenter
                // fit: BoxFit.cover,
                )),
        child: Column(
          children: [
            Container(
              width: 380,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryBg,
                    Color(0xFF93C6E7),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dhikr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          "$count/33",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: increase,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.0),
                      color: custom_grey,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        count.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: reset,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: custom_grey,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "reset",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
