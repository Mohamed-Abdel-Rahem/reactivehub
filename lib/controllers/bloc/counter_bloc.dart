import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInit()) {
    on<IncremetEvent>((event, emit) {
      emit(CounterUpdate(state.counter + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterUpdate(state.counter - 1));
    });
    on<ResetEvent>((event, emit) {
      emit(CounterInit());
    });
  }
}
