part of 'counter_bloc_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

class CounterBlocInitial extends CounterState {
  const CounterBlocInitial() : super(counterValue: 0);
}

class IncrementState extends CounterState {
  const IncrementState(int increasedvalue)
      : super(counterValue: increasedvalue);
}

class DecrementState extends CounterState {
  const DecrementState(int decreasedValue)
      : super(counterValue: decreasedValue);
}
