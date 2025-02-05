import 'package:flutter/material.dart';

import 'package:tp2/models/task.dart';

class Ecran1 extends StatelessWidget {

  List<Task> tasks = Task.generateTask(50);

  Ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) =>
          Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            color: Colors.grey,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightGreen,
                child: Text(tasks[index].id.toString()),
              ),
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].tags.join(" ")),
            ),
          ),
    );
  }
}
