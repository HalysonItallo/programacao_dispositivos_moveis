import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/task_repository.dart';

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
