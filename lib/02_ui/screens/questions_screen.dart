import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizonepiece/01_data/data/questions.dart';
import 'package:quizonepiece/02_ui/core/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key, required this.onSelectAnswer})
      : super(key: key);

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    //Mit Widget kann man vom Widget Sachen weiterleiten zum State
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(30),
            // List of Strings mit map in andere Werte konvertieren
            //Map erstellt eine neue Liste => Beide Listen im Speicher vorhanden
            //Shuffel würde die originale Liste verändern
            //Spread nimmt die Werte aus der Liste und schreibt sie einzeln?
            ...currentQuestion.getShuffledAnswers().map((item) => AnswerButton(
                answer: item,
                callback: () {
                  answerQuestion(item);
                })),
          ],
        ),
      ),
    );
  }
}
