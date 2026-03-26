import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInit()) {
    on<IncremetEvent>((event, emit) {
      emit(CounterUpdate(5));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterUpdate(5));
    });
    on<ResetEvent>((event, emit) {
      emit(CounterInit());
    });
  }
}
