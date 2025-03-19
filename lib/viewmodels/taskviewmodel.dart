import 'package:flutter/material.dart';
import 'package:tp2/models/task.dart';

class TaskViewModel extends ChangeNotifier {
  late List<Task> liste;

  TaskViewModel() {
    liste=[];
  }

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