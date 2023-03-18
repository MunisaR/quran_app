import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final VoidCallback answerTap;

  const Answer({
    Key? key,
    required this.answerText,
    required this.answerColor,
    required this.answerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return InkWell(
      onTap: answerTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: answerColor,
              border: Border.all(color: primaryBg),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              answerText,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    ); //Container
  }
}
