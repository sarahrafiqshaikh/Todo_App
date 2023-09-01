import 'package:flutter/material.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import '../utilities/todo_list_fun.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of todo Task
  List toDoList = [
    ["Make utorial", false],
    ["Sarah", true],
  ];
//check tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  //Create new task
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return const DialogBox();
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 117, 160),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TO DO APP'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskDone: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
