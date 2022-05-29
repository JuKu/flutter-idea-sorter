part of 'area_selection_bloc.dart';

@immutable
abstract class AreaSelectionState {}

/// This state is the initial state and means that the Bloc has not verified yet,
/// if an area is selected.
/// This means, that the last selected area will be read from shared preferences or
/// the first available area is choosen (if no area exists, on is created).
class AreaSelectionInitial extends AreaSelectionState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state means, that no area is selected
class NoAreaSelectedState extends AreaSelectionState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state means, that an area is selected and the ideas can be shown.
class AreaSelectedState extends AreaSelectionState with EquatableMixin {
  final int selectedAreaID;
  final String selectedAreaName;

  AreaSelectedState(
      {required this.selectedAreaID, required this.selectedAreaName});

  @override
  List<Object?> get props => [];
}
