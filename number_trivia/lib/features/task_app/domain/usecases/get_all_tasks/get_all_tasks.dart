import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';

class GetAllTasks extends UseCase<List<TaskModel>, NoParams> {
  final TaskRepository taskRepository;

  GetAllTasks({required this.taskRepository});

  @override
  Future<Either<Failure, List<TaskModel>>> call(NoParams params) async {
    return await taskRepository.getAllTasks();
  }
}
