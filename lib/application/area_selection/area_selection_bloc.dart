import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_idea_sorter/domain/models/area_model.dart';
import 'package:flutter_idea_sorter/domain/usecases/area_usecases.dart';

part 'area_selection_event.dart';

part 'area_selection_state.dart';

class AreaSelectionBloc extends Bloc<AreaSelectionEvent, AreaSelectionState> {
  final AreaUseCases areaUseCases;

  AreaSelectionBloc({required this.areaUseCases})
      : super(AreaSelectionInitial()) {
    on<SelectAreaEvent>((event, emit) async {
      /// read data from database, update UI and choose new state
      final AreaModel? result =
          await areaUseCases.getAreaModelById(event.areaID);

      /// save the selected area to shared preferences
      areaUseCases.saveSelectedArea(result!.areaID);

      emit.call(AreaSelectedState(
          selectedAreaID: event.areaID, selectedAreaName: result!.title));
    });
  }
}
