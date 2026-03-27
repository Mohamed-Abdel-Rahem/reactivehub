part of 'taskbc_bloc.dart';

sealed class TaskbcState extends Equatable {
  const TaskbcState();
  
  @override
  List<Object> get props => [];
}

final class TaskbcInitial extends TaskbcState {}
