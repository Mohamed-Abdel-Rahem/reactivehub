import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/counter_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/counter_event.dart';
import 'package:reactivehub/bloc_counter_depi/sconde_screen.dart';
import 'package:reactivehub/bloc_counter_depi/theme_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/theme_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    //hire order function
    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });
    on<DecrementEvent>((event, emit) {
      if (state == 0) {
        emit(0);
      } else {
        emit(state - 1);
      }
    });
    on<ResetEvent>((event, emit) {
      emit(0);
    });
  }
  // @override
  // void onEvent(CounterEvent event) {
  //   // TODO: implement onEvent
  //   super.onEvent(event);
  //   print('$event is added');
  // }

  // @override
  // void onTransition(Transition<CounterEvent, int> transition) {
  //   // TODO: implement onTransition
  //   super.onTransition(transition);
  //   print(
  //     'transition current state ${transition.currentState} new state ${transition.nextState}',
  //   );
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   // TODO: implement onError
  //   super.onError(error, stackTrace);
  //   print('error ${error.toString()}');
  // }
}
