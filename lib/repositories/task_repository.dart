import '../models/task.dart';
import '../services/task_service.dart';

class TaskRepository {
  final TaskService service = TaskService();

  List<Task> getTasks() {
    return service.getTasks();
  }

  void addTask(Task task) {
    service.addTask(task);
  }

  void deleteTask(int index) {
    service.deleteTask(index);
  }

  void changeStatus(int index) {
    service.changeStatus(index);
  }
}