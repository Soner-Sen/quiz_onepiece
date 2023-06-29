import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizonepiece/01_data/quiz/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({Key? key, required this.itemData}) : super(key: key);

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const Gap(20),
        Expanded(
            child: Column(
          children: [
            Text(
              itemData['question'] as String,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              itemData['user_answer'] as String,
              style: const TextStyle(color: Colors.white60),
            ),
            const Gap(5),
            Text(
              itemData['correct_answer'] as String,
              style: const TextStyle(color: Colors.white70),
            ),
            const Gap(15),
          ],
        ))
      ],
    );
  }
}
