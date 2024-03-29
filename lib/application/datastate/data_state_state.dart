part of 'data_state_bloc.dart';

@immutable
abstract class DataStateState {}

/// This state is the initial state and means that the Bloc has not verified yet,
/// if the data is loaded or not
class DataStateInitial extends DataStateState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state represents the waiting while loading the data from backend
class LoadingDataState extends DataStateState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state represents the case, if no idea exists in database for this area.
class NoIdeasDataState extends DataStateState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state is current, if no area exists in database
class NoAreasDataState extends DataStateState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state is current, if one or multiple ideas was loaded from database
class IdeaOverviewLoadedDataState extends DataStateState with EquatableMixin {
  final ideas;

  IdeaOverviewLoadedDataState(this.ideas);

  @override
  List<Object?> get props => [ideas];
}
