import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizonepiece/01_data/quiz/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({Key? key, required this.summaryData})
      : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData
                .map(
                  (data) => SummaryItem(itemData: data),
                )
                .toList()),
      ),
    );
  }
}
