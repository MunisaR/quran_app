import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/utils/99_names.dart';

class NamesOfAllah extends StatelessWidget {

  const NamesOfAllah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sizeDefinerForFrame(int num) {
      if (num <= 9) {
        return 23;
      } else if (num <= 99) {
        return 18;
      } else {
        return 13;
      }}
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Allohning 99 ismlari"
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.asset(
                'assets/icons/bismillah.png',
                // height: 48,
                width: MediaQuery.of(context).size.width * 0.70,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
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
                            left: sizeDefinerForFrame(i).toDouble(),
                            child: Text(
                              names[i]['number'].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      title: Text(
                        names[i]['name'] as String,
                        style: const TextStyle(fontSize: 25),
                        textAlign: TextAlign.right,
                      ),
                      subtitle: Text(
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 15),
                          '${names[i]['transliteration']}\n${names[i]['meaning']}'),
                      onTap: () {


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
    );
  }
}
