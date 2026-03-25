import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev; // مكتبة احترافية للـ Logging

class MyObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // استخدمنا dev.log عشان الكونسول يكون منظم
    dev.log('🟢 Create: [${bloc.runtimeType}]', name: 'BLOC_OBSERVER');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    dev.log('📩 Event: [${bloc.runtimeType}] -> $event', name: 'BLOC_OBSERVER');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // الـ Transition بيوريك الرحلة كاملة (الحالة القديمة -> الحدث -> الحالة الجديدة)
    dev.log(
      '🔄 Transition: [${bloc.runtimeType}] \n'
      '   From: ${transition.currentState} \n'
      '   Event: ${transition.event} \n'
      '   Next: ${transition.nextState}',
      name: 'BLOC_OBSERVER',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    dev.log(
      '🔴 Error: [${bloc.runtimeType}] \n'
      '   Message: $error',
      name: 'BLOC_OBSERVER',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    dev.log('⚪ Close: [${bloc.runtimeType}]', name: 'BLOC_OBSERVER');
  }
}
