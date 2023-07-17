import 'package:flutter/material.dart';
import 'package:flutter_app1/models/todo_model.dart';
import 'package:flutter_app1/services/todo_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TodoModel> todo = [];
  bool isLoading = true;

  gettodo() async {
    todo = await Todoservice().getTodoData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    gettodo();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  todo[index].title ?? "--",
                  style: TextStyle(color: Color(0xff117ad2)),
                ),
                subtitle: Text(todo[index].completed.toString() ?? "--"),
                trailing: Icon(Icons.task),
              );
            });
  }
}
