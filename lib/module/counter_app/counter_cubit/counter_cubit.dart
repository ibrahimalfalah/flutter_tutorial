import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialCounterState());


  /// the smallest way to write a function
  static CounterCubit get(context) => BlocProvider.of(context);

   // the largest way to write a function
  /*static getCounterCubit(context)
  {
    return BlocProvider.of(context);
  } */

  int value = 0;

   incrementValue() {
    value = value + 1;
    print('increment value is $value');
    emit(IncrementCounterState());
  }

  void decrementValue() {
    value = value - 1;
    print('decrement value is $value');
   emit(DecrementCounterState());
  }

}