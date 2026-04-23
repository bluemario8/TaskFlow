import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:taskflow/main.dart';
import '../models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String category = '';
  DateTime dueDate = DateTime.now();
  TaskPriority priority = TaskPriority.low;
  bool isCompleted = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Task task = Task(title, category, dueDate, priority, isCompleted);

      db.collection("tasks").add(task.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Task Title"),
                onSaved: (value) {
                  title = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a task title";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Category"),
                onSaved: (value) {
                  category = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Please enter a category";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DateTimeFormField(
                decoration: InputDecoration(labelText: "Due Date"),
                onSaved: (DateTime? value) {
                  dueDate = value!;
                },
                validator: (value) {
                  if (value == null) {
                    return "Please enter a due date";
                  }
                  return null;
                }
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}