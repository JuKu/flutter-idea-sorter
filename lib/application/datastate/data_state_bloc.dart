import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:equatable/equatable.dart';

part 'data_state_event.dart';

part 'data_state_state.dart';

class DataStateBloc extends Bloc<DataStateEvent, DataStateState> {
  final IdeaUseCases ideaUseCases;

  DataStateBloc({required this.ideaUseCases}) : super(DataStateInitial()) {
    on<LoadAllDataOverviewEvent>((event, emit) async {
      final ideas = await ideaUseCases.listIdeaOverviewsByArea(event.areaID);

      if (ideas.isEmpty) {
        emit.call(NoIdeasDataState());
      } else {
        emit.call(IdeaOverviewLoadedDataState(ideas));
      }
    });
  }
}
