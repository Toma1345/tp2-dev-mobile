import 'package:flutter/material.dart';
import 'package:tp2/home.dart';
import 'package:tp2/mytheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return MaterialApp(
        title: "TD2",
        home: Home(),
        theme: theme,
    );
  }
  
}