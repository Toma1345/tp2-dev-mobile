import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp2/home.dart';
import 'package:tp2/mytheme.dart';
import 'package:tp2/viewmodels/settingsviewmodels.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';
import 'dart:async';
import 'package:path/path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
    onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY, title TEXT, description TEXT, tags TEXT, difficulty INTEGER, nbhours INTEGER)'
        );
    },
    version: 1,
  );

  final db = await database;
  runApp(MyApp(database: db,));
}

class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            SettingViewModel settingViewModel = SettingViewModel();
            return settingViewModel;
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            TaskViewModel taskViewModel = TaskViewModel.database(database);
            //taskViewModel.generateTasks();
            return taskViewModel;
          },
        )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context, SettingViewModel notifier, child) {
          return MaterialApp(
            title: "TD2",
            home: Home(),
            theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
          );
        },
      ),
    );
  }
}