import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskflow/widgets/authgate.dart';
import 'firebase_options.dart';

// var db = FirebaseFirestore.instance;
//
// Future<void> main() async {
//   // Initialize firestore
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   // initialize date form widget
//   WidgetsFlutterBinding.ensureInitialized();
//   await findSystemLocale();
//
//   await db.collection("tasks").get().then((event) {
//     for (var doc in event.docs) {
//       Task task = Task.fromFirebase(doc);
//       print("${task.id} ${task.title} ${task.category} " +
//           "${task.dueDate.toString()} ${task.priority} ${task.isCompleted}");
//       print("${doc.id} => ${doc.data()}");
//     }
//   });
//
//   runApp(
//     MaterialApp(
//       theme: theme,
//       home: TaskFlow(),
//     ),
//   );
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthGate(),
    );
  }
}