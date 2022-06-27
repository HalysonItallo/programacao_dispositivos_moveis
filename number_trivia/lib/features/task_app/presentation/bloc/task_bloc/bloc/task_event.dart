import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';

part 'task_event.freezed.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.addTask(TaskModel task) = _AddTask;

  const factory TaskEvent.deleteTask(String id) = _DeleteTask;

  const factory TaskEvent.getAllTasks() = _GetAllTasks;
}
