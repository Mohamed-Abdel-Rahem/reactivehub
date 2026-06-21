part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counterA;
  final int counterB;
  const CounterState(this.counterA, this.counterB);
  @override
  List<Object?> get props => [counterA, counterB];
}

class CounterInit extends CounterState {
  
  const CounterInit() : super(0, 0);
}

class CounterUpdate extends CounterState {
  // بنستلم الرقم هنا (int counter) وبعدين نبعته للأب (super)
  // CounterUpdate(int counter) : super(counter);
  const CounterUpdate(super.counterA, super.counterB);
}
