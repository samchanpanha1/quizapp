import 'package:flutter/material.dart';

class Todo {
  String task;
  bool isDone;
  Todo({
    this.task,
    this.isDone = false,
  });

  bool setIsDone(bool isDone) {
    this.isDone = isDone;
  }

  @override
  String toString() => 'Todo(task: $task, isDone: $isDone)';
}
