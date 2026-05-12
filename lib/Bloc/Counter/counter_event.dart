import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncrementEvent extends CounterEvent {
  const CounterIncrementEvent();
}

class CounterDecrementEvent extends CounterEvent {
  const CounterDecrementEvent();
}
