import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../widgets/task_card.dart';
import '../widgets/task_header_card.dart';
import 'package:taskflow/models/task.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // horizontal category labels
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Categories",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Container(
            height: 75,
            margin: EdgeInsets.symmetric(vertical: 4.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dummyTaskHeader.length,
              itemBuilder: (context, index) {
                return TaskHeaderCard(
                  title: dummyTaskHeader[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.transparent,
                );
              },
            ),
          ),
          Flexible(
            child: Center(
              child: ListView.separated(
                itemCount: dummyTask.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    title: dummyTask[index].title,
                    date: DateFormat('MMM dd').format(dummyTask[index].dueDate),
                    priority: dummyTask[index].priority,
                    isCompleted: dummyTask[index].isCompleted,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.transparent,
                    height: 4,
                  );
                },
              ),
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