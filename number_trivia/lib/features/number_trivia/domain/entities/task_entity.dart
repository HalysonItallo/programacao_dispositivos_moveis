import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String? id;
  final String description;

  const TaskEntity({required this.description, this.id});

  @override
  List<Object?> get props => [description];
}
