import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactivehub/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'taskbc_event.dart';
part 'taskbc_state.dart';

class TaskbcBloc extends Bloc<TaskbcEvent, TaskbcState> {
  TaskbcBloc() : super(TaskbcInitial()) {
    on<AddEvent>((event, emit) {
      TaskModel model = TaskModel(
        title: event.title,
        id: Uuid().v4(),
        isCompleted: false,
      );
      //take the last state of the list and append
      List<TaskModel> newList = List.from(state.tasksList)..add(model);

      emit(UpdatebcTask(newList));

      //spread operator
      // emit(UpdateTask([...state.tasksList, model]));
    });
    on<RemoveEvent>((event, emit) {
      //     //return the list not contain this id
      List<TaskModel> updatedList = state.tasksList
          .where((task) => task.id != event.id.toString())
          .toList();
      emit(UpdatebcTask(updatedList));
    });
    on<ToogleEvent>((event, emit) {
      List<TaskModel> newList = state.tasksList.map((task) {
        return task.id == event.id.toString()
            ? task.copyWith(isCompleted: !task.isCompleted)
            : task;
      }).toList();
      emit(UpdatebcTask(newList));
    });
  }
}
