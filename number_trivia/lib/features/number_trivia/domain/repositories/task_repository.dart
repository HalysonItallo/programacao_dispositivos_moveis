import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/data/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskModel>> addTask(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> getAllTasks();
  Future<Either<Failure, bool>> deleteTask(String id);
}
