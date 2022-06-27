import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:task_app/features/task_app/domain/usecases/add_task/add_task.dart';
import 'package:task_app/features/task_app/domain/usecases/delete_task/delete_task.dart';
import 'package:task_app/features/task_app/domain/usecases/get_all_tasks/get_all_tasks.dart';
import 'package:task_app/features/task_app/presentation/bloc/bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_event.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetAllTasks getAllTasks;
  final AddTask addTask;
  final DeleteTask deleteTask;

  TaskBloc({
    required this.getAllTasks,
    required this.addTask,
    required this.deleteTask,
  }) : super(const TaskState.empty()) {
    on<TaskEvent>(_onTaskEvent);
  }

  Future<void> _onTaskEvent(TaskEvent event, Emitter<TaskState> emit) {
    return event.when(
        addTask: ((task) async {}),
        deleteTask: ((id) async {}),
        getAllTasks: (() async {}));
  }
}
