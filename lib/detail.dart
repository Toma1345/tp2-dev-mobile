import 'package:flutter/material.dart';

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
            Text('Number of hours : ${task.nbhours}')
          ],
        )
      ),
    );
  }


}