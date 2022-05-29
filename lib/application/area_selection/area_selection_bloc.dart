import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';

part 'area_selection_event.dart';

part 'area_selection_state.dart';

class AreaSelectionBloc extends Bloc<AreaSelectionEvent, AreaSelectionState> {
  final IdeaUseCases ideaUseCases;

  AreaSelectionBloc({required this.ideaUseCases})
      : super(AreaSelectionInitial()) {
    on<SelectAreaEvent>((event, emit) async {
      // TODO: read data from database, update UI and choose new state
    });
  }
}
