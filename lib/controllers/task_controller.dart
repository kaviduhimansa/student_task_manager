import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskController {
  final TaskRepository repository = TaskRepository();

  List<Task> get tasks {
    return repository.getTasks();
  }

  void addTask(Task task) {
    repository.addTask(task);
  }

  void deleteTask(int index) {
    repository.deleteTask(index);
  }

  void changeStatus(int index) {
    repository.changeStatus(index);
  }
}