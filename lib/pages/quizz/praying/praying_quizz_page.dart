import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:quran_app/pages/quizz/answer.dart';
import 'package:quran_app/pages/quizz/praying/praying_questions.dart';

class PrayingQuizPage extends StatefulWidget {
  const PrayingQuizPage({Key? key}) : super(key: key);

  @override
  State<PrayingQuizPage> createState() => _PrayingQuizPage();
}

class _PrayingQuizPage extends State<PrayingQuizPage> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  var buttonColor = Colors.white;

  void _questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      _scoreTracker.add(
        answerScore
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      if (_questionIndex + 1 == praying.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    if (_questionIndex >= praying.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praying'),
        backgroundColor: primaryBg,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/icons/white_bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Image(
                    image: const AssetImage('assets/icons/bismillah.png'),
                    width: MediaQuery.of(context).size.width * 0.40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    if (_scoreTracker.isEmpty)
                      const SizedBox(
                        height: 25.0,
                      ),
                    if (_scoreTracker.isNotEmpty) ..._scoreTracker
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                  child: Center(
                    child: Text(
                      praying[_questionIndex]['questionText'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              ...(praying[_questionIndex]['answers'] as List<Map<String, Object>>)
                  .map(
                (answer) => Answer(
                  answerText: answer['text'] as String,
                  answerColor: buttonColor,
                  answerTap: () {
                    if (answerWasSelected) {
                      buttonColor = Colors.grey;
                      return;
                    }
                    _questionAnswered(answer['score'] as bool);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryBg),
                ),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Please select an answer before going to the next question'),
                    ));
                    return;
                  }
                  _nextQuestion();
                },
                child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
              ),
              const SizedBox(
                height: 20,
              ),
              if (answerWasSelected && !endOfQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: correctAnswerSelected ? Colors.green : Colors.red,
                  child: Center(
                    child: Text(
                      correctAnswerSelected
                          ? 'Well done, you got it right!'
                          : 'Wrong :/',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (endOfQuiz)
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  // color: Colors.black,
                  child: Center(
                    child: Text(
                      _totalScore > 4
                          ? 'Congratulations! Your final score is: $_totalScore'
                          : 'Your final score is: $_totalScore. Better luck next time!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: _totalScore > 4 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
