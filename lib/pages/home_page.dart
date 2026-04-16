import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import '../models/task.dart';

class TaskFlow extends StatelessWidget {
  const TaskFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['All', 'Personal', 'Work', 'Health', 'School'];
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
      body: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(category, style: TextStyle(color: Colors.white)),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
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
                  isCompleted: task.isCompleted,
                );
              },
            ),
          ),
        ],
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