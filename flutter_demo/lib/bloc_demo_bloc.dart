import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_demo_event.dart';
part 'bloc_demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoInitial> {
  DemoBloc() : super(DemoInitial()) {
    on<DemoEvent>((event, emit) {
      // TODO: implement event handler
      emit(state);
    });
  }
}
