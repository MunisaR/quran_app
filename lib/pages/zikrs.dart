import 'dart:ffi';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:quran_app/utils/zikrlar.dart';

class Zikrs extends StatefulWidget {
  const Zikrs({Key? key}) : super(key: key);

  @override
  State<Zikrs> createState() => _ZikrsState();
}

class _ZikrsState extends State<Zikrs> {
  dynamic z1 = {'count': 1, 'user': 0};
  dynamic z2 = {'count': 3, 'user': 0};
  dynamic z3 = {'count': 3, 'user': 0};
  dynamic z4 = {'count': 3, 'user': 0};
  dynamic z5 = {'count': 1, 'user': 0};
  dynamic z6 = {'count': 1, 'user': 0};
  dynamic z7 = {'count': 3, 'user': 0};
  dynamic z8 = {'count': 4, 'user': 0};

  var collection = [
    {'count': 3, 'user': 0, "isCompleted": 0},
    {'count': 1, 'user': 0, "isCompleted": 0},
    {'count': 3, 'user': 0, "isCompleted": 0},
    {'count': 3, 'user': 0, "isCompleted": 0},
    {'count': 1, 'user': 0, "isCompleted": 0},
    {'count': 1, 'user': 0, "isCompleted": 0},
    {'count': 3, 'user': 0, "isCompleted": 0},
    {'count': 4, 'user': 0, "isCompleted": 0}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Text("Zikr va Duolar Toplami"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: zikrlar.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 13),
                          child: Text(
                            zikrlar[index]['zikr_arabic'] as String,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 13),
                          child: Text(
                            zikrlar[index]['zikr_uzbek'] as String,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 13),
                          child: Text(
                            zikrlar[index]['zikr_translation'] as String,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 13),
                          child: Text(
                            zikrlar[index]['zikr_ref'] as String,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    collection[index] = {
                                      ...collection[index],
                                      'count': collection[index]['count']! - 1
                                    };
                                    if (collection[index]['count'] == 0) {
                                      setState(() {
                                        collection[index]['isCompleted'] = 1;
                                      });
                                    }
                                  });
                                  print(collection[index]['count']);
                                },
                                child: Text("+"),
                              ),
                            ),
                            collection[index]['isCompleted'] == 1
                                ? Expanded(
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                          'assets/done.json',
                                          width: 50,
                                          height: 50,
                                        ),
                                        Text(
                                            textAlign: TextAlign.center,
                                            "Ma Sha Allah!\nYou have finished this rememberance")
                                      ],
                                    ),
                                  )
                                : Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: primaryBg,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        collection[index]['count'].toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (collection[index]['count']! >= 0) {
                                      collection[index] = {
                                        ...collection[index],
                                        'count': collection[index]['count']! + 1
                                      };
                                    }
                                    if (collection[index]['count']! > 0) {
                                      setState(() {
                                        collection[index]['isCompleted'] = 0;
                                      });
                                    }
                                  });
                                },
                                child: Text("-"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ListTile(
// title: Text(zikrlar[index]['zikr_arabic'] as String),
// trailing: GestureDetector(
// onTap: () {
// z1 = {...z1, "count": z1['count'] -1};
// print(z1['count']);
// },
// child: Icon(
// Icons.add,
// size: 30,
// ),
// ),
// )
