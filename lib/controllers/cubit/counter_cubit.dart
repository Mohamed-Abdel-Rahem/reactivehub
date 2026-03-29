// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// part 'counter_state.dart';

// class CounterCubit extends HydratedCubit<CounterState> {
//   CounterCubit() : super(CounterInit());
//   void increment() {
//     // teke the last state and add from this state 1
//     emit(CounterUpdate(state.counter + 1));
//   }

//   void decrement() {
//     // teke the last state and minus from this state 1
//     emit(CounterUpdate(state.counter - 1));
//   }

//   void reset() {
//     // teke the last state and minus from this state 1
//     emit(CounterUpdate(0));
//   }

//   @override
//   CounterState? fromJson(Map<String, dynamic> json) {
//     return CounterUpdate(json['counter']);
//   }

//   @override

//   Map<String, dynamic>? toJson(CounterState state) {
//     return {'counter': state.counter};
//   }
// }
