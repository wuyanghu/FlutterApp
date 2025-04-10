part of 'bloc_demo_bloc.dart';

@immutable
abstract class DemoState {}

class DemoInitial extends DemoState {
  final int? count;

  DemoInitial({this.count});

  DemoInitial copyWith({int? count}) {
    return DemoInitial(count: count ?? this.count);
  }
}
