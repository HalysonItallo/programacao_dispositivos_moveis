import 'package:equatable/equatable.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';

class DeleteTask extends UseCase<bool, DeleteTaskParams> {
  final TaskRepository taskRepository;

  DeleteTask({required this.taskRepository});

  @override
  Future<Either<Failure, bool>> call(DeleteTaskParams params) async {
    return await taskRepository.deleteTask(params.id);
  }
}

class DeleteTaskParams extends Equatable {
  final String id;

  const DeleteTaskParams({required this.id});

  @override
  List<Object?> get props => [id];
}
