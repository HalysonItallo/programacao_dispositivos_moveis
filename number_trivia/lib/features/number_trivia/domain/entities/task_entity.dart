import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String description;

  const TaskEntity({required this.description});

  @override
  List<Object?> get props => [description];
}
