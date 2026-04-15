import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      home: TaskFlow(),
    ),
  );
}