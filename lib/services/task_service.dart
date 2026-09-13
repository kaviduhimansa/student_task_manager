import '../models/task.dart';

class TaskService {
  final List<Task> tasks = [];

  List<Task> getTasks() {
    return tasks;
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void changeStatus(int index) {
    tasks[index].completed = !tasks[index].completed;
  }
}