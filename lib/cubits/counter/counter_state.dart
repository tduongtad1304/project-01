part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;

  const CounterState({
    required this.counterValue,
  });

  factory CounterState.initial() {
    return const CounterState(
      counterValue: 0,
    );
  }

  @override
  String toString() => 'CounterState { counterValue: $counterValue }';

  @override
  List<Object> get props => [counterValue];

  CounterState copyWith({
    int? counterValue,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }
}
