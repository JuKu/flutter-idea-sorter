import 'package:flutter_idea_sorter/application/datastate/data_state_bloc.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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

  group("LoadAllDataOverviewEvent", () {
    const areaID = 1;

    test("should call IdeaUseCases", () async {
      when(mockIdeaUseCases.listIdeaOverviewsByArea(any))
          .thenAnswer((_) async => []);

      expect(dataStateBloc.state, equals(DataStateInitial()));

      dataStateBloc.add(LoadAllDataOverviewEvent(areaID));

      // await until all use cases are called
      await untilCalled(mockIdeaUseCases.listIdeaOverviewsByArea(any));
      //verifyNoMoreInteractions(mockIdeaUseCases);

      const noIdeaState = TypeMatcher<NoIdeasDataState>();

      /// https://pub.dev/packages/bloc_test

      /// expectLater(dataStateBloc.state, equals(NoIdeasDataState()));
      expectLater(dataStateBloc.stream, emitsInOrder([noIdeaState]));
    });
  });
}
