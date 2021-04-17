import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/note_app/note_app.dart';
import 'package:quiz_app/todo_app/todo_app.dart';

import 'note_app/note_notifer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: TodoApp(),
    );
  }
}

/*
return ChangeNotifierProvider(
      create: (_) => NoteNotifier(),
      child: MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        home: NoteApp(),
      ),
    );
*/