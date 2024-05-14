import "package:flutter/material.dart";
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/models/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(
      () {
        selectedAnswers = [];
        activeScreen = 'questions-screen';
      },
    );
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomePage(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = Questions(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 76, 5, 138),
                Color.fromARGB(255, 113, 51, 167),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: screenWidget),
        ),
      ),
    );
  }
}
