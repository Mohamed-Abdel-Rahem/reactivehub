import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
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

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterUpdate(json['counter']);//*** */
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {'counter': state.counter};
  }
}
