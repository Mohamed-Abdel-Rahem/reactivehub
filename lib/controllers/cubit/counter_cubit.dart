import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInit());
  void increment() {
    // teke the last state and add from this state 1
    emit(CounterUpdate(state.counter + 1));
  }

  void decrement() {
    // teke the last state and minus from this state 1
    emit(CounterUpdate(state.counter - 1));
  }
}
