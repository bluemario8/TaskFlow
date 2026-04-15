import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import '../models/task.dart';

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
      body: ListView.separated(
        itemCount: dummyTasks.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
        itemBuilder: (context, index) {
          final task = dummyTasks[index];
          return TaskCard(
            title: task.title,
            date: '${task.dueDate.month}/${task.dueDate.day}',
            priority: task.priority.name,
          );
        },
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