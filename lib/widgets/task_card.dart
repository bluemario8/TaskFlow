import 'package:flutter/material.dart';
import 'package:taskflow/models/task.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final TaskPriority priority;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.priority,
    required this.isCompleted,
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
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (isCompleted) {
                        return Positioned(
                          left: 10,
                          top: 2,
                          child: Icon(Icons.check_circle_outline, size: 24)
                        );
                      }

                      return Container();
                    },
                  ),
                ],
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