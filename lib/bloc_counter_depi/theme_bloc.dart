import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/counter_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/counter_event.dart';
import 'package:reactivehub/bloc_counter_depi/sconde_screen.dart';
import 'package:reactivehub/bloc_counter_depi/theme_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/theme_event.dart';

class ThemeBloc extends Bloc<ChangeModeEvent, bool> {
  ThemeBloc() : super(false) {
    on<ChangeModeEvent>((event, emit) {
      emit(!state);
    });
  }
  // @override
  // void onEvent(ChangeModeEvent event) {
  //   // TODO: implement onEvent
  //   super.onEvent(event);
  //   if (event == true) {
  //     print('dark');
  //   } else {
  //     print('light');
  //   }
  // }

  // @override
  // void onTransition(Transition<ChangeModeEvent, bool> transition) {
  //   // TODO: implement onTransition

  //   print(
  //     'transition current state ${transition.currentState} new state ${transition.nextState}',
  //   );
  // }
}
