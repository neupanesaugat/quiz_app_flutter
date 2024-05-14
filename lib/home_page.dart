import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 60),
        Text('Learn Flutter the Fun Way! ',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(150, 255, 255, 255),
            )),
        const SizedBox(height: 40),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: const Color.fromARGB(223, 84, 48, 145),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          icon: const Icon(Icons.arrow_right_alt_outlined),
          label: const Text(
            'Start',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
