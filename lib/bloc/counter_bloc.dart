import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter=0;
  CounterBloc() : super(CounterInitial()) {
    on<IncreaseCounter>((event, emit) {
     emit(onCounterChanged(counter: ++counter));
    });
    on<DecreaseCounter>((event, emit) {
     emit(onCounterChanged(counter: --counter));
    });
    on<ResetCounter>((event, emit) {
      counter=0;
     emit(const onCounterChanged(counter: 0));
    });
  }
}
