import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  const Answer({
    Key? key,
    required this.selectHandler,
    required this.answerText
  }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: ()=> selectHandler, style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, foregroundColor: Colors.white
      ),
      child: Text(answerText),),
    )
  }
}
