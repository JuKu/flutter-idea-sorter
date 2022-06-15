part of 'save_state_bloc.dart';

@immutable
abstract class SaveStateState {}

/// This state is the saved and initial state and means that the user has already saved
/// all changes
class SavedChangesState extends SaveStateState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

/// This state means that the user has edited the current idea and has not saved the changes yet
class UnsavedChangesState extends SaveStateState with EquatableMixin {
  @override
  List<Object?> get props => [];
}
