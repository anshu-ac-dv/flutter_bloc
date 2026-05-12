import 'package:bloc/bloc.dart';
import 'package:bloc_learning/Bloc/Counter/counter_event.dart';
import 'package:bloc_learning/Bloc/Counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() :super(CounterState()){
    on<CounterIncrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}