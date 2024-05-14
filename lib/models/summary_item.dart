import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems(this.itemData, {super.key});

  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData["chosen_answer"] == itemData["correct_answer"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['chosen_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 152, 252),
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 143, 231, 154),
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ],
    );
  }
}
