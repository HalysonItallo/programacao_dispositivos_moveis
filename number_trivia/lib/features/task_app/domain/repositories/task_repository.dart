import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskModel>> addTask(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> getAllTasks();
  Future<Either<Failure, bool>> deleteTask(String id);
}
