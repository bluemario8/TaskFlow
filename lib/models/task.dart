import 'package:cloud_firestore/cloud_firestore.dart';
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

  // initialize Task with Firebase snapshot
  factory Task.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    Task task = Task(
      data?['title'],
      data?['category'],
      (data?['dueDate'] as Timestamp).toDate(),
      TaskPriority.values.byName(data?['priority']),
      data?['isCompleted'],
    );
    task.id = data?['id'];
    return task;
  }

  factory Task.fromJson(
      Map<String, dynamic> snapshot,
      ) {
    final data = snapshot;
    Task task = Task(
      data['title'],
      data['category'],
      (data['dueDate'] as Timestamp).toDate(),
      TaskPriority.values.byName(data['priority']),
      data['isCompleted'],
    );
    task.id = data['id'];
    return task;
  }

  Map<String, dynamic> toJson() {
    // priority.name returns the value of enum.
    // e.g. TaskPriority.low.name = "low"
    return {
      "id": id, "title": title, "category": category,
      "dueDate": dueDate, "priority": priority.name, "isCompleted": isCompleted
    };
  }
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