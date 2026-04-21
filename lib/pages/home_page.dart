import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/pages/task_detail_page.dart';
import '../widgets/task_card.dart';
import '../widgets/task_header_card.dart';
import 'package:taskflow/models/task.dart';
import 'add_task_page.dart';

class TaskFlow extends StatefulWidget {
  const TaskFlow({super.key});

  @override
  State<TaskFlow> createState() => _TaskFlowState();
}

class _TaskFlowState extends State<TaskFlow> {
  int _currentIndex = 0;

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
        iconTheme: IconThemeData(color: Colors.white), // Color for hamburger menu button
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("TaskFlow"),
            ),
            ListTile(
              title: Text("Sign Out"),
              onTap: () {},
            ),
          ],
        ),
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
                  final task = dummyTask[index];

                  return Dismissible(
                    key: Key(task.title + index.toString()), // must be unique

                    direction: DismissDirection.endToStart, // swipe right → left

                    onDismissed: (direction) {
                      setState(() {
                        dummyTask.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${task.title} deleted")),
                      );
                    },

                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailPage(task: task, onToggleStatus: (Task p1) {  },),
                          ),
                        );
                      },
                      child: TaskCard(
                        title: task.title,
                        date: DateFormat('MMM dd').format(task.dueDate),
                        priority: task.priority,
                        isCompleted: task.isCompleted,
                        onToggleComplete: () {
                          setState(() {
                            task.isCompleted = !task.isCompleted;
                          });
                        },
                      ),
                    ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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