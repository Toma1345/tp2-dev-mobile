import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/detail.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

class Ecran1 extends StatefulWidget {


  Ecran1({super.key});

  @override
  State<Ecran1> createState() => _Ecran1State();
}

class _Ecran1State extends State<Ecran1> {
  late List<Task> tasks;

  String tags='';

  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detail(
                          task: tasks[index]
                      ),
                  )
                );
              },
            ),
          ),
    );
  }
}
