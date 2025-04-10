import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_demo_event.dart';
part 'bloc_demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoInitial> {
  DemoBloc() : super(DemoInitial(count: 0)) {
    on<DemoEvent>((event, emit) {
      emit(state.copyWith(count: state.count! + 1));
    });
  }
}
