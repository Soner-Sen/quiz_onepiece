import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizonepiece/01_data/data/questions.dart';
import 'package:quizonepiece/01_data/quiz/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key, required this.chosenAnswers, required this.onRestart})
      : super(key: key);

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // Create a Map {}
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Du hast $numCorrectQuestions von $numTotalQuestions Fragen richtig beantwortet! :)',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Gap(39),
                QuestionsSummary(summaryData: summaryData),
                const Gap(30),
                TextButton.icon(
                    onPressed: onRestart,
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Restart Quiz!'))
              ],
            )));
  }
}
