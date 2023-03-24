import 'package:flutter/material.dart';
import 'package:quran_app/pages/praying/male/praying_steps.dart';

import '../../../DRY/colors.dart';

class MalePraying extends StatefulWidget {
  const MalePraying({Key? key}) : super(key: key);

  @override
  State<MalePraying> createState() => _MalePrayingState();
}

class _MalePrayingState extends State<MalePraying> {
  int _stepIndex = 0;

  void nextStep() {
    setState(() {
      _stepIndex++;
    });
    if (_stepIndex >= prayingMale.length) {
      _stepIndex = 0;
    }
  }

  void backStep() {
    setState(() {
      if (_stepIndex > 0) {
        _stepIndex--;
      } else if (_stepIndex == 0) {
        _stepIndex = 0;
      }
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  prayingMale[_stepIndex]['step'] as String,
                  style: const TextStyle(fontSize: 30),
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: custom_grey,
                  ),
                  child: Image.asset(
                    prayingMale[_stepIndex]['picture'] as String,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text.rich(
                    TextSpan(
                      text: prayingMale[_stepIndex]['text'] as String,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      splashColor: primaryBg,
                      backgroundColor: primaryBg,
                      onPressed: backStep,
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      splashColor: primaryBg,
                      backgroundColor: primaryBg,
                      onPressed: nextStep,
                      child: const Icon(Icons.arrow_forward_outlined),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
