import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInit()) {
    on<IncremetEventA>((event, emit) {
      emit(CounterUpdate(state.counterA + 1, state.counterB));
    });
    on<DecrementEventA>((event, emit) {
      emit(CounterUpdate(state.counterA - 1, state.counterB));
    });

    on<IncremetEventB>((event, emit) {
      emit(CounterUpdate(state.counterA, state.counterB + 1));
    });
    on<DecrementEventB>((event, emit) {
      emit(CounterUpdate(state.counterA, state.counterB - 1));
    });
    on<ResetEvent>((event, emit) {
      emit(CounterInit());
    });
  }
}
