part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;
  final bool? isIncremented;

  const CounterState({required this.counterValue, this.isIncremented});

  Map<String, dynamic> toMap() {
    return {
      "counterValue": counterValue,
      "isIncremented": isIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    //if(map == null) return null;

    return CounterState(
      counterValue: map["counterValue"],
      isIncremented: map["isIncremented"],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) => CounterState
      .fromMap(json.decode(source));
}
