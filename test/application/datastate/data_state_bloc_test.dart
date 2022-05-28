import 'package:flutter_idea_sorter/application/datastate/data_state_bloc.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'data_state_bloc_test.mocks.dart';

@GenerateMocks([IdeaUseCases])
void main() {
  late DataStateBloc dataStateBloc;
  late MockIdeaUseCases mockIdeaUseCases;

  setUp(() {
    mockIdeaUseCases = MockIdeaUseCases();
    dataStateBloc = DataStateBloc(ideaUseCases: mockIdeaUseCases);
  });

  group("Initialization", () {
    test("initState should be DataStateInitial", () {
      expect(dataStateBloc.state, equals(DataStateInitial()));
    });
  });
}
