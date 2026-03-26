part of 'counter_cubit.dart';

sealed class CounterState {
  final int counter;
  CounterState(this.counter);
}

class CounterInit extends CounterState {
  CounterInit() : super(0);
}

class CounterUpdate extends CounterState {
  CounterUpdate(super.counter);
}
