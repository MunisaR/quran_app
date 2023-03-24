import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:quran_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}
///////
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBg,
          shadowColor: Colors.transparent,
          title: const Text(
            "Quran",
            style: TextStyle(color: Colors.white),

          ),
        ),
        body:
            const MainPage() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
