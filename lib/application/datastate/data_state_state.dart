part of 'data_state_bloc.dart';

@immutable
abstract class DataStateState {}

/// This state is the initial state and means that the Bloc has not verified yet,
/// if the data is loaded or not
class DataStateInitial extends DataStateState {}

/// This state represents the waiting while loading the data from backend
class LoadingDataState extends DataStateState {}
