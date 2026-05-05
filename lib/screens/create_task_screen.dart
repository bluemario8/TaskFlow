import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();

  DateTime? _dueDate;
  TaskPriority _priority = TaskPriority.medium;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() => _dueDate = picked);
    }
  }

  Future<void> _saveTask() async {
    final user = _auth.currentUser;
    if (user == null) return;

    if (_titleController.text.trim().isEmpty || _dueDate == null) return;

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .add({
      'title': _titleController.text.trim(),
      'category': _categoryController.text.trim(),
      'dueDate': Timestamp.fromDate(_dueDate!),
      'priority': _priority.name,
      'isCompleted': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
    print("TASK SAVED for user: ${user.uid}");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Text(_dueDate == null
                    ? "No date selected"
                    : _dueDate.toString().split(' ')[0]),
                const Spacer(),
                TextButton(
                  onPressed: _pickDate,
                  child: const Text("Pick Date"),
                ),
              ],
            ),

            const SizedBox(height: 16),

            DropdownButton<TaskPriority>(
              value: _priority,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _priority = value);
                }
              },
              items: TaskPriority.values.map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority.name),
                );
              }).toList(),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: _saveTask,
              child: const Text("Create Task"),
            ),
          ],
        ),
      ),
    );
  }
}