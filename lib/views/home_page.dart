import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController controller = TaskController();

  @override
  Widget build(BuildContext context) {
    int total = controller.tasks.length;

    int completed = controller.tasks
        .where((task) => task.completed)
        .length;

    int pending = total - completed;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Task Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Dashboard cards
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    'Total',
                    total.toString(),
                    Icons.list_alt,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _buildSummaryCard(
                    'Completed',
                    completed.toString(),
                    Icons.check_circle,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _buildSummaryCard(
                    'Pending',
                    pending.toString(),
                    Icons.pending_actions,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Add task button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
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

                icon: const Icon(Icons.add),

                label: const Text(
                  'Add New Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Task List',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Task list
            Expanded(
              child: controller.tasks.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task_alt,
                            size: 60,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No tasks yet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Add a new task to get started',
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.tasks.length,

                      itemBuilder: (context, index) {
                        var task = controller.tasks[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(14),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        task.title,
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          decoration: task.completed
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),

                                    Icon(
                                      task.completed
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      size: 25,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.category,
                                      size: 18,
                                    ),

                                    const SizedBox(width: 5),

                                    Text(
                                      task.category,
                                      style: const TextStyle(fontSize: 14),
                                    ),

                                    const SizedBox(width: 15),

                                    const Icon(
                                      Icons.flag,
                                      size: 18,
                                    ),

                                    const SizedBox(width: 5),

                                    Text(
                                      task.priority,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  'Status: ${task.completed ? 'Completed' : 'Pending'}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            controller.changeStatus(index);
                                          });
                                        },

                                        icon: Icon(
                                          task.completed
                                              ? Icons.undo
                                              : Icons.check,
                                        ),

                                        label: Text(
                                          task.completed
                                              ? 'Pending'
                                              : 'Complete',
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            controller.deleteTask(index);
                                          });
                                        },

                                        icon: const Icon(
                                          Icons.delete_outline,
                                        ),

                                        label: const Text('Delete'),
                                      ),
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

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),

        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}