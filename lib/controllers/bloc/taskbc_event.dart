part of 'taskbc_bloc.dart';

sealed class TaskbcEvent extends Equatable {
  const TaskbcEvent();

  @override
  List<Object> get props => [];
}

class AddEvent extends TaskbcEvent {
  final String title;
  const AddEvent(this.title);
}

class RemoveEvent extends TaskbcEvent {
  final String id;
  const RemoveEvent(this.id);
}

class ToogleEvent extends TaskbcEvent {
  final String id;
  const ToogleEvent(this.id);
}
