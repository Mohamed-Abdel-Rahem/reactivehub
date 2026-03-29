import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactivehub/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'taskbc_event.dart';
part 'taskbc_state.dart';

class TaskbcBloc extends HydratedBloc<TaskbcEvent, TaskbcState> {
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

  @override
  TaskbcState? fromJson(Map<String, dynamic> json) {
    return UpdatebcTask(
      (json['tasksList'] as List<dynamic>)
          .map((task) => TaskModel.fromJson(task))
          .toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(TaskbcState state) {
    return {'tasksList': state.tasksList.map((task) => task.toJson()).toList()};
  }
}
