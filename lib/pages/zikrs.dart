import 'package:flutter/material.dart';
import 'package:quran_app/utils/zikrlar.dart';

class Zikrs extends StatefulWidget {
  const Zikrs({Key? key}) : super(key: key);

  @override
  State<Zikrs> createState() => _ZikrsState();
}

class _ZikrsState extends State<Zikrs> {
  dynamic z1 = {'count': 3, 'user': 0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: zikrlar.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(zikrlar[index]['zikr'] as String),
          trailing: GestureDetector(
            onTap: () {
              z1 = {...z1, "count": z1['count'] -1};
              print(z1['count']);
            },
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    ));
  }
}
