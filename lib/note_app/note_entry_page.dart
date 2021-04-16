import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note_notifer.dart';

class NoteEntryPage extends StatelessWidget {
  const NoteEntryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteNotifier = Provider.of<NoteNotifier>(context);
    final priority = ValueNotifier(0);
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              controller: titleController,
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              value: priority.value,
              icon: Text('Priority'),
              items: List.generate(
                3,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(index.toString()),
                ),
              ),
              onChanged: (value) => priority.value = value,
            ),
            TextField(
              controller: bodyController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Taking note of.....',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final note = Note(
              title: titleController.text,
              body: bodyController.text,
              date: DateTime.now(),
              priority: priority.value);
          noteNotifier.addNote(note);
          // notes.add(note);
          // print(notes);
          Navigator.of(context).pop();
          // print(note.toString());
        },
        child: Icon(Icons.edit_outlined),
      ),
    );
  }
}
