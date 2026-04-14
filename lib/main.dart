import 'package:flutter/material.dart';
// import 'app_colors.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF00BCD4),
);
final theme = ThemeData.from(
  colorScheme: colorScheme
);

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      title: "TaskFlow",
      home: Scaffold(
        appBar: AppBar(
          title: Text("TaskFlow"),
          backgroundColor: theme.primaryColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 100,
              ),
              Text(
                "No tasks yet",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                "Tap + to add your first task",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}