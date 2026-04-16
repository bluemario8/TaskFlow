import 'package:flutter/material.dart';
import 'package:id_gen/id_gen_helpers.dart';

enum TaskPriority {
  high,
  medium,
  low,
}

class Task {
  int id = genTransitId;
  String title;
  String category;
  DateTime dueDate;
  TaskPriority priority;
  bool isCompleted;

  Task(this.title, this.category, this.dueDate, this.priority, this.isCompleted);
}

List<Task> dummyTask = [
  Task("Take dog out for a walk", "Dog",
       DateTime.now(), TaskPriority.low, true),
  Task("Do gym workout", "Workout",
      DateTime.now(), TaskPriority.medium, false),
  Task("Set up grocery list", "Grocery",
      DateTime.now(), TaskPriority.high, true),
  Task("Take dog out for a walk", "Dog",
      DateTime.now(), TaskPriority.low, false),
  Task("Do gym workout", "Workout",
      DateTime.now(), TaskPriority.medium, true),
  Task("Set up grocery list", "Grocery",
      DateTime.now(), TaskPriority.high, false),
  Task("Take dog out for a walk", "Dog",
      DateTime.now(), TaskPriority.low, false),
  Task("Do gym workout", "Workout",
      DateTime.now(), TaskPriority.medium, true),
  Task("Set up grocery list", "Grocery",
      DateTime.now(), TaskPriority.high, true),
  Task("Take dog out for a walk", "Dog",
      DateTime.now(), TaskPriority.low, false),
  Task("Do gym workout", "Workout",
      DateTime.now(), TaskPriority.medium, false),
  Task("Set up grocery list", "Grocery",
      DateTime.now(), TaskPriority.high, false),
];

// Maybe consider creating a set and a list
// Use the set to check if the header exists or not
// if not, add it to both
List<String> dummyTaskHeader = [
  "Dog",
  "Workout",
  "Grocery",
];