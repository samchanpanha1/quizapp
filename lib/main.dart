import 'package:flutter/material.dart';
import 'package:quiz_app/note_app/note_app.dart';
import 'package:quiz_app/quiz_app/quiz_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: NoteApp(),
    );
  }
}

