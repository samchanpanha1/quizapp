import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/quiz_app/question.dart';

import 'option.dart';

class QuestionScreenMiddleware extends StatelessWidget {
  const QuestionScreenMiddleware({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _question = Provider.of<QuizNotifier>(context).currentQuestion;
    return QuestionScreen(
      question: _question,
    );
  }
}

class QuestionScreen extends StatefulWidget {
  final Question question;

  const QuestionScreen({
    Key key,
    this.question,
  }) : super(key: key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentOptionId;
  bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final isComplete = isCorrect != null;
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<QuizNotifier>(
        create: (context) {
          final a = QuizNotifier(questions);
          print(a);
          a.updateProgress();
          return a;
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.text,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 15,
              ),
              for (var option in question.options)
                RadioListTile(
                    title: Text(option.text.toString()),
                    groupValue: currentOptionId,
                    value: option.id,
                    onChanged: (value) {
                      if (!isComplete)
                        setState(() {
                          currentOptionId = value;
                        });
                    }),
              SizedBox(
                height: 50,
              ),
              Spacer(),
              if (isCorrect != null)
                Text(isCorrect ? 'You are correct!' : 'You are wrong!'),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(isComplete ? 'Continue' : 'Submit'),
                  onPressed: () {
                    if (isComplete) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return QuestionScreen();
                      }));
                    }
                    if (currentOptionId != null)
                      setState(() {
                        isCorrect = currentOptionId == question.correctAnswerId;
                      });
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Question> questions = [question, question2];

final question2 = Question(
  text: 'What is JAVA?',
  correctAnswerId: 2,
  options: [
    Option(id: 1, text: 'Wings flapping'),
    Option(id: 2, text: 'Programming Language OOP'),
    Option(id: 3, text: 'Multi Platform UI Kit'),
    Option(id: 4, text: 'Word'),
  ],
);

final question = Question(
  text: 'What is flutter?',
  correctAnswerId: 3,
  options: [
    Option(id: 1, text: 'Wings flapping'),
    Option(id: 2, text: 'Programming Language'),
    Option(id: 3, text: 'Multi Platform UI Kit'),
    Option(id: 4, text: 'Word'),
  ],
);

class QuizNotifier extends ChangeNotifier {
  List<Question> questions;
  QuizNotifier(this.questions)
      : currentQuestion = questions.first,
        progress = 0;
  int progress;
  bool isFinished = false;
  int score;

  Question currentQuestion;
  void updateProgress() {
    progress++;
    currentQuestion = questions[progress];
    if (currentQuestion == questions.last) isFinished = true;
  }
}
