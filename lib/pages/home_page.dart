import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class TaskFlow extends StatelessWidget {
  const TaskFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TaskFlow",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          children: const [
            TaskCard(
              title: "Take dog out for walk",
              date: "4/16",
              priority: "low",
            ),
            TaskCard(
              title: "Do gym workout",
              date: "4/18",
              priority: "medium",
            ),
            TaskCard(
              title: "Set up grocery List",
              date: "4/20",
              priority: "high",
            ),
          ],
        ),
      ),
    );
  }
}

// --- Empty State Screen aka "No tasks yet" -------------------------
// class TaskFlow extends StatelessWidget {
//   const TaskFlow({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "TaskFlow",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.check_circle_outline, size: 60),
//             Text(
//               "No tasks yet",
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(
//               "Tap + to add your first task",
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }