import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/note_app/note_app.dart';


import 'note_app/note_notifer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteNotifier(),
      child: MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        home: NoteApp(),
      ),
    );
  }
}
