part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncremetEventA extends CounterEvent {}

class DecrementEventA extends CounterEvent {}

class IncremetEventB extends CounterEvent {}

class DecrementEventB extends CounterEvent {}

class ResetEvent extends CounterEvent {}
