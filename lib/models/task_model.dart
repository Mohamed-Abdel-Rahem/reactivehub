// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  // TODO: implement props
  List<Object?> get props => [id, title, isCompleted];

  TaskModel copyWith({String? title, String? id, bool? isCompleted}) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
