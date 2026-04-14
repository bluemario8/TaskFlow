import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: TaskFlow(),
    ),
  );
}

class TaskFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TaskFlow",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 60),
            Text(
              "No tasks yet",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Tap + to add your first task",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
