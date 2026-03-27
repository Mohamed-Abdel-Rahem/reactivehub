import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'taskbc_event.dart';
part 'taskbc_state.dart';

class TaskbcBloc extends Bloc<TaskbcEvent, TaskbcState> {
  TaskbcBloc() : super(TaskbcInitial()) {
    on<TaskbcEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
