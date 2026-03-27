part of 'taskbc_bloc.dart';

sealed class TaskbcState extends Equatable {
  final List<TaskModel> tasksList;
  const TaskbcState(this.tasksList);

  @override
  List<Object> get props => [tasksList];
}

final class TaskbcInitial extends TaskbcState {
  TaskbcInitial() : super([]);
}

final class UpdatebcTask extends TaskbcState {
  const UpdatebcTask(super.tasksList);
}
