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
}
