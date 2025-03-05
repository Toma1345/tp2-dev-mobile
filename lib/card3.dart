import 'package:flutter/material.dart';
import 'package:tp2/api/myapi.dart';

import 'models/todo.dart';

class Ecran3 extends StatefulWidget {

  Ecran3({super.key});

  @override
  State<Ecran3> createState() => _Ecran3State();
}

class _Ecran3State extends State<Ecran3> {
  final myApi = MyApi();

  late Future<List<Todo>> futureTodo;

  @override
  void initState() {
    super.initState();
    futureTodo = myApi.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureTodo,
        builder: (context, snapshot){
          if (snapshot.connectionState!=ConnectionState.done && !snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.data != null){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      child: Text(snapshot.data?[index].id.toString()??""),
                    ),
                    title: Text(snapshot.data?[index].title??""),
                    subtitle: Checkbox(
                      value:snapshot.data?[index].completed,
                      onChanged: (bool? value) {},
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        }
    );
  }
}
