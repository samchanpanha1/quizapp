import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:provider/provider.dart';
import 'package:quiz_app/note_app/note_entry_page.dart';
import 'package:quiz_app/note_app/note_notifer.dart';

import 'colors_note.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteNotifier = Provider.of<NoteNotifier>(context);
    return Theme(
      data: ThemeData(primarySwatch: Colors.green),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notes App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              for (var note in noteNotifier.currentNotes)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: getColor(rangeColors, note.priority.toString()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('!' + note.priority.toString()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(
                                note.body,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                DateFormat('MMMM, dd,yyyy').format(note.date),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NoteEntryPage()));
          },
          child: Icon(Icons.edit_outlined),
        ),
      ),
    );
  }
}

List<ColorNote> rangeColors = [
  ColorNote(color: Colors.red, id: '0'),
  ColorNote(color: Colors.yellow, id: '1'),
  ColorNote(color: Colors.blue, id: '2')
];

Color getColor(List<ColorNote> rangeColors, String id) {
  final getC = rangeColors.where((element) => element.id == id).toList();
  return getC[0].color;
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}
