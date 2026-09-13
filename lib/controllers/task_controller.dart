
import '../models/task.dart';

class TaskController {
  final List<Task> tasks = [];

  // Add a new task
  void addTask(Task task) {
    tasks.add(task);
  }

  // Delete a task
  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  // Change task status
  void changeStatus(int index) {
    tasks[index].completed = !tasks[index].completed;
  }
}

