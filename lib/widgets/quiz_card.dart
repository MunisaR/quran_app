import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:quran_app/utils/categories.dart';
import 'package:quran_app/utils/quiz_categories.dart';

class QuizCard extends StatefulWidget {
  const QuizCard({Key? key}) : super(key: key);

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quizzz",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryBg,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/icons/bg3.png'),
          alignment: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              quizCategories.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Card(

                      elevation: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [Color(0xFFABD9FF), primaryBg],
                          ),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        quizzCategories[index]['route']
                                            as Widget,
                                  ));
                            },
                            child: Text(
                              quizzCategories[index]["name"] as String,
                              style: const TextStyle(
                                  fontSize: 27, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
