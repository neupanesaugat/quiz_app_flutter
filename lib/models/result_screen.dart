import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.onRestart, required this.chosenAnswers});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].questions,
          "correct_answer": questions[i].answers[0],
          "chosen_answer": chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["chosen_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity, //Uses full width of the screen it runs on
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions answers correctly! ",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(233, 255, 255, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
                onPressed: () {
                  onRestart();
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: Text(
                  "Restart Quiz!",
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(233, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
