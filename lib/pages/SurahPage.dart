import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SurahPage extends StatefulWidget {
  final int index;

  const SurahPage({Key? key, required this.index}) : super(key: key);

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List surahList = [];
  List surahTranslate = [];
  late List sura;
  String suraName='';
  String englishaname='';
  late List OneSurahTranslate;

  Future res() async {
    final response = await rootBundle.loadString('./QuranAssets/quran.json');
    final data = await json.decode(response);
    final response1 =
        await rootBundle.loadString('./QuranAssets/translate.json');
    final data1 = await json.decode(response1);
    setState(() {
      surahList = [
        data['data']['surahs']
            .where((element) => element['number'] == widget.index)
      ];
      surahTranslate = [
        data1['data']['surahs']
            .where((element) => element['number'] == widget.index)
      ];
      sura = surahList[0].toList()[0]['ayahs'];
      suraName =surahList[0].toList()[0]['name'];
      englishaname =surahList[0].toList()[0]['englishName'];
      OneSurahTranslate = surahTranslate[0].toList()[0]['ayahs'];
      if (kDebugMode) {
        print('surahList');

      }
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('My App'),
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              // background: Image.asset(
              //   'assets/icons/mosque.png',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: index == 0
                        ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(englishaname, textAlign: TextAlign.center, style: TextStyle(fontSize: 25), ),
                              ),
                              // Text(surahList[0]['revelationType'], textAlign: TextAlign.center, style: TextStyle(fontSize: 25), ),
                              // Text((surahList[0]['ayahs'].length-1).toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 25), ),

                              Text("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ الٓم", textAlign: TextAlign.center, style: TextStyle(fontSize: 25), ),
                            ],
                          )),
                        )
                        : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListTile(
                              leading: index == 0
                                  ? Text(
                                      "",
                                      style: TextStyle(fontSize: 22),
                                    )
                                  : Stack(
                                      children: [
                                        Image.asset(
                                          'assets/icons/oyat_frame.png',
                                        ),
                                        Positioned(
                                          top: 19,
                                          left: sizeDefinerForFrame(index)
                                              .toDouble(),
                                          child: Text(
                                            index.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: index <= 9 ? 18 : 15),
                                          ),
                                        )
                                      ],
                                    ),
                              title: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  sura[index]['text'],
                                  style: TextStyle(fontSize: index == 0 ? 24 : 22),
                                  textAlign: index == 0
                                      ? TextAlign.center
                                      : TextAlign.right,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(fontSize: 15),
                                    index == 0
                                        ? ''
                                        : '${OneSurahTranslate[index]['text']}'),
                              ),

                              onTap: () {},
                              onLongPress: () {
                                // Handle onLongPress event here
                              },
                            ),
                        ),
                  ),
                );
              },
              childCount: OneSurahTranslate.length,
            ),
          ),
        ],
      ),
    );
  }
}
