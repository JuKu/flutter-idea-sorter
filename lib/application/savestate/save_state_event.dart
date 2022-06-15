part of 'save_state_bloc.dart';

@immutable
abstract class SaveStateEvent {}

/// This event is fired if the user clicks the save button and the idea was saved.
/// This means the save icon color should be changed.
class SaveEvent extends SaveStateEvent {
  ///
}

/// This event is fired, if the user changes something on an idea, e.q. the title, description and so on and
/// has not clicked the save button.
class UserChangeEvent extends SaveStateEvent {
  ///
}
