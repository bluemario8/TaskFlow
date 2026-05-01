import 'package:cloud_firestore/cloud_firestore.dart';

enum TaskPriority { low, medium, high }

class Task {
  String? id;
  String title;
  String category;
  DateTime dueDate;
  TaskPriority priority;
  bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.category,
    required this.dueDate,
    required this.priority,
    required this.isCompleted,
  });

  /// Firestore → Task
  factory Task.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    final data = snapshot.data()!;

    return Task(
      id: snapshot.id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      dueDate: (data['dueDate'] as Timestamp).toDate(),
      priority: TaskPriority.values.byName(data['priority']),
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  /// Task → Firestore
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "dueDate": Timestamp.fromDate(dueDate),
      "priority": priority.name,
      "isCompleted": isCompleted,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }
}