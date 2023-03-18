import 'package:flutter/material.dart';
import 'package:quran_app/DRY/colors.dart';
import 'package:quran_app/pages/quizz/answer.dart';
import 'package:quran_app/pages/quizz/prophets/prophets_questions.dart';

class ProphetsQuizPage extends StatefulWidget {
  const ProphetsQuizPage({Key? key}) : super(key: key);

  @override
  State<ProphetsQuizPage> createState() => _ProphetsQuizPageState();
}

class _ProphetsQuizPageState extends State<ProphetsQuizPage> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  var buttonColor = Colors.white;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
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
      //when the quiz ends
      if (_questionIndex + 1 == prophets.length) {
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
    // what happens at the end of the quiz
    if (_questionIndex >= prophets.length) {
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
        title: const Text('Prophets'),
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
                      prophets[_questionIndex]['questionText'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              ...(prophets[_questionIndex]['answers'] as List<Map<String, Object>>)
                  .map(
                (answer) => Answer(
                  answerText: answer['text'] as String,
                  answerColor: buttonColor,
                  answerTap: () {
                    if (answerWasSelected) {
                      buttonColor = Colors.grey;
                      return;
                    }
                    //answer is being selected
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
