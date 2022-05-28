part of 'data_state_bloc.dart';

@immutable
abstract class DataStateEvent {}

/// This event is fired if the data should be loaded from backend (database and so on)
class LoadAllDataOverviewEvent extends DataStateEvent {
  final int _areaID;

  LoadAllDataOverviewEvent(this._areaID);

  int get areaID => _areaID;
}
