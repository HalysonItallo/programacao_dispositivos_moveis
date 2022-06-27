import 'package:equatable/equatable.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';

class AddTask extends UseCase<TaskModel, AddTaskParams> {
  final TaskRepository taskRepository;

  AddTask({required this.taskRepository});

  @override
  Future<Either<Failure, TaskModel>> call(AddTaskParams params) async {
    return await taskRepository.addTask(params.task);
  }
}

class AddTaskParams extends Equatable {
  final TaskModel task;

  const AddTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}
