import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactivehub/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void addTask(String title) {
    TaskModel model = TaskModel(
      title: title,
      id: Uuid().v4(),
      isCompleted: false,
    );
    //take the last state of the list and append
    List<TaskModel> newList = List.from(state.tasksList)..add(model);

    emit(UpdateTask(newList));

    //spread operator
    // emit(UpdateTask([...state.tasksList, model]));
  }

  void removeTask(String id) {
    //return the list not contain this id
    List<TaskModel> updatedList = state.tasksList
        .where((task) => task.id != id.toString())
        .toList();
    emit(UpdateTask(updatedList));
  }

  toogleTask(String id) {
    List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == id.toString()
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(UpdateTask(newList));
  }
}
