import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({Key? key, required this.answer, required this.callback})
      : super(key: key);

  final String answer;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink.shade900,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
