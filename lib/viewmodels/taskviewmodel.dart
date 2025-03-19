import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp2/models/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> liste=[];
  Database? database;

  TaskViewModel() {liste=[];}

  TaskViewModel.database(this.database);

  void addTask(Task task) {
    liste.add(task);
    notifyListeners();
  }

  void generateTasks() {
    liste = Task.generateTask(10);
    notifyListeners();
  }

  void deleteTask(Task task) {
    liste.remove(task);
    notifyListeners();
  }

}