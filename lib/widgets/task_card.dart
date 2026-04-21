import 'package:flutter/material.dart';
import 'package:taskflow/models/task.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final TaskPriority priority;
  final bool isCompleted;
  final VoidCallback onToggleComplete;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.priority,
    required this.isCompleted,
    required this.onToggleComplete,
  });

  Color getPriorityColor() {
    switch (priority) {
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.amber;
      default: // low
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: getPriorityColor(),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(
              width: 45,
              child: Center(
                child: IconButton(
                  onPressed: onToggleComplete,
                  icon: Icon(
                    isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    size: 24,
                    color: isCompleted ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}