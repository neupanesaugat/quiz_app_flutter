import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.questionIndex, required this.isCorrectAnswer, super.key});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer
              ? const Color.fromARGB(255, 98, 194, 245)
              : const Color.fromARGB(255, 255, 100, 152),
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        questionNumber.toString(),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
