// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskModel task) addTask,
    required TResult Function(String id) deleteTask,
    required TResult Function() getAllTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetAllTasks value) getAllTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res> implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  final TaskEvent _value;
  // ignore: unused_field
  final $Res Function(TaskEvent) _then;
}

/// @nodoc
abstract class _$$_AddTaskCopyWith<$Res> {
  factory _$$_AddTaskCopyWith(
          _$_AddTask value, $Res Function(_$_AddTask) then) =
      __$$_AddTaskCopyWithImpl<$Res>;
  $Res call({TaskModel task});
}

/// @nodoc
class __$$_AddTaskCopyWithImpl<$Res> extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_AddTaskCopyWith<$Res> {
  __$$_AddTaskCopyWithImpl(_$_AddTask _value, $Res Function(_$_AddTask) _then)
      : super(_value, (v) => _then(v as _$_AddTask));

  @override
  _$_AddTask get _value => super._value as _$_AddTask;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$_AddTask(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc

class _$_AddTask implements _AddTask {
  const _$_AddTask(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'TaskEvent.addTask(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTask &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$_AddTaskCopyWith<_$_AddTask> get copyWith =>
      __$$_AddTaskCopyWithImpl<_$_AddTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskModel task) addTask,
    required TResult Function(String id) deleteTask,
    required TResult Function() getAllTasks,
  }) {
    return addTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
  }) {
    return addTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetAllTasks value) getAllTasks,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
  }) {
    return addTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class _AddTask implements TaskEvent {
  const factory _AddTask(final TaskModel task) = _$_AddTask;

  TaskModel get task => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AddTaskCopyWith<_$_AddTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteTaskCopyWith<$Res> {
  factory _$$_DeleteTaskCopyWith(
          _$_DeleteTask value, $Res Function(_$_DeleteTask) then) =
      __$$_DeleteTaskCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteTaskCopyWithImpl<$Res> extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_DeleteTaskCopyWith<$Res> {
  __$$_DeleteTaskCopyWithImpl(
      _$_DeleteTask _value, $Res Function(_$_DeleteTask) _then)
      : super(_value, (v) => _then(v as _$_DeleteTask));

  @override
  _$_DeleteTask get _value => super._value as _$_DeleteTask;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DeleteTask(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteTask implements _DeleteTask {
  const _$_DeleteTask(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TaskEvent.deleteTask(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTask &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteTaskCopyWith<_$_DeleteTask> get copyWith =>
      __$$_DeleteTaskCopyWithImpl<_$_DeleteTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskModel task) addTask,
    required TResult Function(String id) deleteTask,
    required TResult Function() getAllTasks,
  }) {
    return deleteTask(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
  }) {
    return deleteTask?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetAllTasks value) getAllTasks,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
  }) {
    return deleteTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class _DeleteTask implements TaskEvent {
  const factory _DeleteTask(final String id) = _$_DeleteTask;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_DeleteTaskCopyWith<_$_DeleteTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetAllTasksCopyWith<$Res> {
  factory _$$_GetAllTasksCopyWith(
          _$_GetAllTasks value, $Res Function(_$_GetAllTasks) then) =
      __$$_GetAllTasksCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetAllTasksCopyWithImpl<$Res> extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_GetAllTasksCopyWith<$Res> {
  __$$_GetAllTasksCopyWithImpl(
      _$_GetAllTasks _value, $Res Function(_$_GetAllTasks) _then)
      : super(_value, (v) => _then(v as _$_GetAllTasks));

  @override
  _$_GetAllTasks get _value => super._value as _$_GetAllTasks;
}

/// @nodoc

class _$_GetAllTasks implements _GetAllTasks {
  const _$_GetAllTasks();

  @override
  String toString() {
    return 'TaskEvent.getAllTasks()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetAllTasks);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskModel task) addTask,
    required TResult Function(String id) deleteTask,
    required TResult Function() getAllTasks,
  }) {
    return getAllTasks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
  }) {
    return getAllTasks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskModel task)? addTask,
    TResult Function(String id)? deleteTask,
    TResult Function()? getAllTasks,
    required TResult orElse(),
  }) {
    if (getAllTasks != null) {
      return getAllTasks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetAllTasks value) getAllTasks,
  }) {
    return getAllTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
  }) {
    return getAllTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTask value)? addTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetAllTasks value)? getAllTasks,
    required TResult orElse(),
  }) {
    if (getAllTasks != null) {
      return getAllTasks(this);
    }
    return orElse();
  }
}

abstract class _GetAllTasks implements TaskEvent {
  const factory _GetAllTasks() = _$_GetAllTasks;
}
