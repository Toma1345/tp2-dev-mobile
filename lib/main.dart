import 'package:flutter/material.dart';
import 'package:tp2/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TD2",
        // theme: MyTheme.dark(),
        home: Home()
    );
  }
  
}