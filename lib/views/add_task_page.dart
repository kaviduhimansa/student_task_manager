
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

  TextEditingController taskNameController = TextEditingController();

  String category = 'Assignment';
  String priority = 'High';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text('Task Name'),

            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter task name',
              ),
            ),

            const SizedBox(height: 20),

            const Text('Category'),

            DropdownButton<String>(
              value: category,
              isExpanded: true,

              items: [
                'Assignment',
                'Lecture',
                'Research',
                'Exam',
                'Personal',
              ].map((value) {
                return DropdownMenuItem(
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

            const SizedBox(height: 20),

            const Text('Priority'),

            DropdownButton<String>(
              value: priority,
              isExpanded: true,

              items: [
                'High',
                'Medium',
                'Low',
              ].map((value) {
                return DropdownMenuItem(
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

              child: ElevatedButton(
                onPressed: () {

                  if (taskNameController.text.trim().isEmpty) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter task name'),
                      ),
                    );

                    return;
                  }

                  Task task = Task(
                    title: taskNameController.text,
                    category: category,
                    priority: priority,
                  );

                  widget.controller.addTask(task);

                  Navigator.pop(context);
                },

                child: const Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

