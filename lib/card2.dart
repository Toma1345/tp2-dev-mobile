import 'package:flutter/material.dart';
import 'package:tp2/api/myapi.dart';

class Ecran2 extends StatelessWidget {
  final myApi = MyApi();

  Ecran2({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: myApi.getTasks(),
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
                  subtitle: Text(snapshot.data?[index].tags.join(" ")??""),
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
