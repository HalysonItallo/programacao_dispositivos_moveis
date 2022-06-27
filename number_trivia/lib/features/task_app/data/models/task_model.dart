import 'package:task_app/features/task_app/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    String? id,
    required String description,
  }) : super(description: description, id: id);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      description: json['description'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
    };
  }
}
