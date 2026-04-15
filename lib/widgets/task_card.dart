import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final String priority;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.priority,
  });

  Color getPriorityColor() {
    switch (priority) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.amber;
      default:
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
            SizedBox(width: 12),
            Icon(Icons.check_circle_outline, size: 24),
            SizedBox(width: 12),
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