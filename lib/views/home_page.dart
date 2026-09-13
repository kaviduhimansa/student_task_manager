import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TaskController controller = TaskController();

  @override
  Widget build(BuildContext context) {

    int completed = controller.tasks
        .where((task) => task.completed)
        .length;

    int pending = controller.tasks.length - completed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Task Manager'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // Dashboard
            Text(
              'Total Tasks: ${controller.tasks.length}',
              style: const TextStyle(fontSize: 20),
            ),

            Text(
              'Completed: $completed',
              style: const TextStyle(fontSize: 20),
            ),

            Text(
              'Pending: $pending',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            // Add New Task
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskPage(
                      controller: controller,
                    ),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: const Text('Add New Task'),
            ),

            const SizedBox(height: 20),

            const Text(
              'Task List',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Screen 3 - Task List
            Expanded(
              child: ListView.builder(
                itemCount: controller.tasks.length,

                itemBuilder: (context, index) {

                  var task = controller.tasks[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          // Task Name
                          Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Category
                          Text(
                            'Category: ${task.category}',
                          ),

                          // Priority
                          Text(
                            'Priority: ${task.priority}',
                          ),

                          // Status
                          Text(
                            'Status: ${task.completed ? 'Completed' : 'Pending'}',
                          ),

                          const SizedBox(height: 10),

                          // Complete and Delete
                          Row(
                            children: [

                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    controller.changeStatus(index);
                                  });
                                },
                                child: Text(
                                  task.completed
                                      ? 'Pending'
                                      : 'Complete',
                                ),
                              ),

                              const SizedBox(width: 10),

                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    controller.deleteTask(index);
                                  });
                                },
                                child: const Text('Delete'),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}