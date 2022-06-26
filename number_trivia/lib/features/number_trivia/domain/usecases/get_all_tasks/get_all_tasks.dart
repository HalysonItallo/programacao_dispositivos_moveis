import 'package:number_trivia/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/data/models/task_model.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/task_repository.dart';

class GetAllTasks extends UseCase<List<TaskModel>, NoParams> {
  final TaskRepository taskRepository;

  GetAllTasks({required this.taskRepository});

  @override
  Future<Either<Failure, List<TaskModel>>> call(NoParams params) async {
    return await taskRepository.getAllTasks();
  }
}
