import 'package:flutter/material.dart';
import '../models/task.dart';
import '../controllers/task_controller.dart';

class AddTaskPage extends StatefulWidget {
  final TaskController controller;

  const AddTaskPage({
    super.key,
    required this.controller,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController taskNameController =
      TextEditingController();

  String category = 'Assignment';
  String priority = 'High';

  final List<String> categories = [
    'Assignment',
    'Lecture',
    'Research',
    'Exam',
    'Personal',
  ];

  final List<String> priorities = [
    'High',
    'Medium',
    'Low',
  ];

  @override
  void dispose() {
    taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Create New Task',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Enter the details of your task below.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Task Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: taskNameController,

              decoration: InputDecoration(
                hintText: 'Enter task name',
                prefixIcon: const Icon(Icons.task_alt),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: category,

              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.category),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              items: categories.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  category = value!;
                });
              },
            ),

            const SizedBox(height: 22),

            const Text(
              'Priority',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: priority,

              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.flag),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              items: priorities.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  priority = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton.icon(
                onPressed: () {
                  if (taskNameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter task name',
                        ),
                      ),
                    );

                    return;
                  }

                  Task task = Task(
                    title: taskNameController.text.trim(),
                    category: category,
                    priority: priority,
                  );

                  widget.controller.addTask(task);

                  Navigator.pop(context);
                },

                icon: const Icon(Icons.add_task),

                label: const Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}