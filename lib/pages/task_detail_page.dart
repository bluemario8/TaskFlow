import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;
  final Function(Task) onToggleStatus;

  const TaskDetailPage({
    super.key,
    required this.task,
    required this.onToggleStatus,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = task.isCompleted;

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Due: ${DateFormat('MMM dd, yyyy').format(task.dueDate)}"),
            const SizedBox(height: 10),
            Text("Priority: ${task.priority}"),
            const SizedBox(height: 10),
            Text("Status: ${isCompleted ? "Completed" : "Pending"}"),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            onToggleStatus(task);
            Navigator.pop(context); // go back after update
          },
          child: Text(
            isCompleted ? "Mark as Pending" : "Mark as Completed",
          ),
        ),
      ),
    );
  }
}