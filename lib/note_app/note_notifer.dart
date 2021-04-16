import 'package:flutter/material.dart';

class NoteNotifier extends ChangeNotifier {
  List<Note> currentNotes = [exampleNote, demoNote, englishNote];

  void addNote(Note note) {
    currentNotes.add(note);
    notifyListeners();
  }
}

class Note {
  final String title;
  final String body;
  final DateTime date;
  //Ranger from 1-3. 1 is very important, 3 is least important
  final int priority;

  Note({
    this.title,
    this.body,
    this.date,
    this.priority,
  });

  @override
  String toString() {
    return 'Note(title: $title, body: $body, date: $date, priority: $priority)';
  }
}

final exampleNote = Note(
    title: 'Creating a notes app',
    body: 'We need to be able to create ,update,delete and read',
    date: DateTime.now(),
    priority: 1);

final demoNote = Note(
    title: 'Today I learn Chinese',
    body: 'We need to be able to create ,update,delete and read',
    date: DateTime.now(),
    priority: 0);

final englishNote = Note(
    title: 'Today I learn English',
    body: 'We need to be able to create ,update,delete and read',
    date: DateTime.now(),
    priority: 2);
