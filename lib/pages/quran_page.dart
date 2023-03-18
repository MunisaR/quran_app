import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/pages/SurahPage.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List surahList = [];

  Future res() async {
    final response = await rootBundle.loadString('./QuranAssets/surahs.json');
    final data = await json.decode(response);
    setState(() {
      surahList = data["data"];
      print(surahList);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    res();
  }

  @override
  Widget build(BuildContext context) {
    double index = 10;
    sizeDefinerForFrame(int num) {
      if (num <= 9) {
        return 23;
      } else if (num <= 99) {
        return 18;
      } else {
        return 13;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          "Quran",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  semanticsLabel: 'My Icon',
                  // height: 48,
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: surahList.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                      ),
                      ListTile(
                        leading: Stack(
                          children: [
                            Image.asset(
                              'assets/icons/oyat_frame.png',
                            ),
                            Positioned(
                              top: 19,
                              left: sizeDefinerForFrame(surahList[i]['number'])
                                  .toDouble(),
                              child: Text(
                                surahList[i]['number'].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: index <= 9 ? 18 : 15),
                              ),
                            )
                          ],
                        ),
                        title: Text(
                          surahList[i]['name'],
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        ),
                        subtitle: Text(
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 15),
                            '${surahList[i]['englishName']} - ${surahList[i]['englishNameTranslation']}'),
                        trailing: surahList[i]['revelationType'] == "Meccan"
                            ? Image.asset(
                                'assets/icons/kaaba.png',
                                width: 40,
                              )
                            : Image.asset(
                                'assets/icons/madina.png',
                                width: 40,
                              ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SurahPage(index: surahList[i]['number']),
                              ));
                        },
                        onLongPress: () {
                          // Handle onLongPress event here
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
