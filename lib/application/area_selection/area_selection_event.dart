part of 'area_selection_bloc.dart';

@immutable
abstract class AreaSelectionEvent {}

/// This event is fired if the data should be loaded from backend (database and so on)
/// class LoadAllAreasEvent extends AreaSelectionEvent {}

class SelectAreaEvent extends AreaSelectionEvent {
  final int _areaID;

  SelectAreaEvent(this._areaID);

  int get areaID => _areaID;
}
