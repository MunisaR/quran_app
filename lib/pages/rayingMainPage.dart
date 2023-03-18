import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      ),
    );
  }
}
