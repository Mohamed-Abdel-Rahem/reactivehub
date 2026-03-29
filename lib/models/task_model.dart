
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  
  final String title;
  final String id;
  final bool isCompleted;

  const TaskModel({
    required this.title,
    required this.id,
    required this.isCompleted,
  });
  @override

  List<Object> get props => [title, id, isCompleted];

  TaskModel copyWith({
    String? title,
    String? id,
    bool? isCompleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      id: map['id'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

 
}
