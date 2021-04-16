import 'option.dart';

class Question {
  final String text;
  final int correctAnswerId;
  final List<Option> options;

  Question({this.text, this.correctAnswerId, this.options});
}
