import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/addtaskform.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

import 'models/task.dart';

class Detail extends StatelessWidget{
  final Task task;

  const Detail({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task ${task.title} detail'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Description : ${task.description}'),
            Text('Tags : ${task.tags.join(" ")}'),
            Text('Difficulty : ${task.difficulty}'),
            Text('Number of hours : ${task.nbhours}'),
            IconButton(
                onPressed: (){
                  context.read<TaskViewModel>().deleteTask(task);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.delete)
            ),
            IconButton(
                onPressed: (){
                  AddTaskForm(task: task);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.edit)
            )
          ],
        )
      ),
    );
  }


}