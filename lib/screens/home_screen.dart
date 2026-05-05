import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'create_task_screen.dart';
import 'package:taskflow/widgets/task_card.dart';
import 'package:taskflow/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _tasksRef {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tasks');
  }

// ── DELETE ───────────────────────────────────────────────
  Future<void> _deleteTask(String taskId) async {
    await _tasksRef.doc(taskId).delete();
  }
// ── LOGOUT ───────────────────────────────────────────────
  Future<void> _logout() async {
    await _auth.signOut();
  }
// ── HELPERS ──────────────────────────────────────────────
  Future<void> _toggleTaskCompletion(Task task) async {
    await _tasksRef.doc(task.id).update({
      'isCompleted': !task.isCompleted,
    });
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateTaskScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _tasksRef
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No tasks yet."));
                }

                final tasks = snapshot.data!.docs
                    .map((doc) => Task.fromFirebase(doc))
                    .toList();

                if (tasks.isEmpty) {
                  return const Center(child: Text("No tasks yet."));
                }

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return Dismissible(
                      key: Key(task.id!), // REQUIRED (must be unique)

                      direction: DismissDirection.endToStart, // swipe right → left

                      onDismissed: (direction) {
                        _deleteTask(task.id!);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${task.title} deleted")),
                        );
                      },

                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),

                      child: TaskCard(
                        title: task.title,
                        date: _formatDate(task.dueDate),
                        priority: task.priority,
                        isCompleted: task.isCompleted,
                        onToggleComplete: () => _toggleTaskCompletion(task),
                      ),
                    );
                  },
                );
              },
            )
          ),
        ],
      ),
    );
  }
}