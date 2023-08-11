import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tut_bloc/domain/cubit/counter_cubit.dart';

void main() {
  group("CounterCubit", (){
    CounterCubit? counterCubit;

    setUp(() => {
      counterCubit = CounterCubit()
    });

    tearDown(() {
      counterCubit!.close();
    });
    
    test("The initial value for CounterCubit is CounterState(counterValue: 0)", () => () {
      expect(counterCubit!.state, const CounterState(counterValue: 0));
    });

    blocTest(
      "The cubit should emit CounterState(counterValue: 1, isIncremented: true)",
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, isIncremented: true)],
    );

    blocTest(
      "The cubit should emit CounterState(counterValue: -1, isIncremented: true)",
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => [const CounterState(counterValue: -1, isIncremented: false)],
    );
  });
}