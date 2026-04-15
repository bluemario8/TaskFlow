import 'package:flutter/material.dart';

enum Priority { high, medium, low }

class Task {
  final int id;
  final String title;
  final String category;
  final DateTime dueDate;
  final Priority priority;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.dueDate,
    required this.priority,
    required this.isCompleted,
  });
}

List<Task> dummyTasks = [
  Task(
    id: 1,
    title: 'Take dog out for walk',
    category: 'Personal',
    dueDate: DateTime(2026, 4, 16),
    priority: Priority.medium,
    isCompleted: false,
  ),
  Task(
    id: 2,
    title: 'Do gym workout',
    category: 'Health',
    dueDate: DateTime(2026, 4, 18),
    priority: Priority.high,
    isCompleted: true,
  ),
  Task(
    id: 3,
    title: 'Set up grocery list',
    category: 'Personal',
    dueDate: DateTime(2026, 4, 20),
    priority: Priority.low,
    isCompleted: true,
  ),
  Task(
    id: 4,
    title: 'Schedule doctor appointment',
    category: 'Health',
    dueDate: DateTime(2026, 4, 20),
    priority: Priority.medium,
    isCompleted: false,
  ),
  Task(
    id: 5,
    title: 'Print papers',
    category: 'Work',
    dueDate: DateTime(2026, 4, 17),
    priority: Priority.low,
    isCompleted: true,
  ),
  Task(
    id: 6,
    title: 'Call client',
    category: 'Work',
    dueDate: DateTime(2026, 4, 18),
    priority: Priority.high,
    isCompleted: false,
  ),
  Task(
    id: 7,
    title: 'Write in journal',
    category: 'Personal',
    dueDate: DateTime(2026, 4, 16),
    priority: Priority.low,
    isCompleted: false,
  ),
  Task(
    id: 8,
    title: 'Practice presentation',
    category: 'Work',
    dueDate: DateTime(2026, 4, 20),
    priority: Priority.high,
    isCompleted: false,
  ),
];