part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  CounterState(this.counter);
  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}

class CounterInit extends CounterState {
  CounterInit() : super(0);
}

class CounterUpdate extends CounterState {
  // بنستلم الرقم هنا (int counter) وبعدين نبعته للأب (super)
  // CounterUpdate(int counter) : super(counter);
  CounterUpdate(super.counter);
}
