import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';

part 'task_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.loading() = _Loading;
  const factory TaskState.loaded(TaskModel taskModel) = _Loaded;
  const factory TaskState.empty() = _Empty;
}
