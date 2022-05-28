import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

part 'data_state_event.dart';

part 'data_state_state.dart';

class DataStateBloc extends Bloc<DataStateEvent, DataStateState> {
  DataStateBloc() : super(DataStateInitial()) {
    on<LoadAllDataOverviewEvent>((event, emit) async {
      //return checkLoginState(event, emit);

      // TODO: add code here
    });
  }
}
