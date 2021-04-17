import 'package:flutter/material.dart';
import 'package:quiz_app/todo_app/todo.dart';
import 'package:quiz_app/todo_app/todo_entry_page.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  void itemChange(bool val, int index) {
    setState(() {
      todos[index].isDone = val;
    });
  }

  final teController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: new ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: new Container(
                          padding: new EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              new CheckboxListTile(
                                activeColor: Colors.pink[300],
                                dense: true,
                                //font change
                                title: new Text(
                                  todos[index].task,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      decoration: todos[index].isDone
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                                value: todos[index].isDone,
                                onChanged: (bool val) {
                                  itemChange(val, index);
                                },
                                secondary: PopupMenuButton(
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        child: Text('Edit'),
                                        value: 'edit-' + index.toString(),
                                      ),
                                      PopupMenuItem(
                                        child: Text('Delete'),
                                        value: 'delete-' + index.toString(),
                                      ),
                                    ];
                                  },
                                  onSelected: (action) {
                                    final a = action.split('-');
                                    // print(action.split('-')[1]);
                                    final checkFunction = a[0];
                                    final indexId = int.parse(a[1]);
                                    if (checkFunction == 'delete') {
                                      setState(() {
                                        todos.removeAt(indexId);
                                      });
                                    }
                                    if (checkFunction == 'edit') {}
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: teController,
              decoration:
                  InputDecoration(hintText: 'Task name', helperText: ''),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                if (teController.text != "") {
                  todos.add(Todo(task: teController.text));
                }
                teController.clear();
              });
            },
            child: Text('Add'),
            color: Colors.cyan,
          ),
          const SizedBox(height: 28.0),
        ],
      ),
    );
  }
}

List<Todo> todos = [Todo(task: 'Finish all 10 app'), Todo(task: 'exersice')];
