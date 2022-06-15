import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:equatable/equatable.dart';

part 'save_state_event.dart';

part 'save_state_state.dart';

class SaveStateBloc extends Bloc<SaveStateEvent, SaveStateState> {
  SaveStateBloc() : super(SavedChangesState()) {
    on<UserChangeEvent>((event, emit) async {
      //return checkLoginState(event, emit);

      // TODO: add code here

      emit.call(UnsavedChangesState());
    });

    on<SaveEvent>((event, emit) async {
      emit.call(SavedChangesState());
    });
  }
}
