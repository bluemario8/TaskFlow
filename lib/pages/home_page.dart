import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 24),
                  Text(
                    "Take dog out for walk",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "4/16",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 24),
                  Text(
                    "Do gym workout",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "4/18",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 24),
                  Text(
                    "Set up grocery List",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "4/20",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
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