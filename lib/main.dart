import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'models/task.dart';
import 'theme.dart';
import 'pages/home_page.dart';

var db = FirebaseFirestore.instance;

Future<void> main() async {
  // Initialize firestore
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // initialize date form widget
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();

  await db.collection("tasks").get().then((event) {
    for (var doc in event.docs) {
      Task task = Task.fromFirebase(doc);
      print("${task.id} ${task.title} ${task.category} " +
          "${task.dueDate.toString()} ${task.priority} ${task.isCompleted}");
      print("${doc.id} => ${doc.data()}");
    }
  });

  runApp(
    MaterialApp(
      theme: theme,
      home: TaskFlow(),
    ),
  );
}