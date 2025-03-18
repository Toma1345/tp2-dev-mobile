import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

class AddTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
          onPressed: () {
            context.read<TaskViewModel>().addTask(Task.newTask());
            Navigator.pop(context);
          },
          child: const Text("Add Task"),
        ),
      ),
    ) ;
  }
}