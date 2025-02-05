import 'package:flutter/material.dart';

import 'package:tp2/models/task.dart';

class Ecran1 extends StatelessWidget {

  List<Task> tasks = Task.generateTask(50);

  Ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(child: Text(tasks[index].id.toString()), backgroundColor: Colors.lightBlue,),
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].tags.join(" ")),
        )
    );
  }
}
