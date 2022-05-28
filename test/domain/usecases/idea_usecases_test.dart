import 'package:flutter_idea_sorter/domain/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'idea_usecases_test.mocks.dart';

@GenerateMocks([IdeaDao])
void main() {
  late IdeaUseCases ideaUseCases;
  late MockIdeaDao mockIdeaDao;

  setUp(() {
    mockIdeaDao = MockIdeaDao();
    ideaUseCases = IdeaUseCases(ideaDao: mockIdeaDao);
  });

  group("countIdeas", () {
    test("should return the correct number of saved ideas", () async {
      // arrange - Umgebung schaffen, dass Test so läuft, wie er läuft
      when(mockIdeaDao.countAll()).thenAnswer((_) async => 0);

      // act - Test ausführen
      final result = await ideaUseCases.countIdeas();

      // assert - Ergebnisse überprüfen
      expect(result, 0);

      // second check
      when(mockIdeaDao.countAll()).thenAnswer((_) async => 1);
      final resul1 = await ideaUseCases.countIdeas();
      expect(resul1, 1);

      // last, check if the correct method was called
      verify(mockIdeaDao.countAll());

      // verify, that mock is not used anymore.
      // See also: https://www.udemy.com/course/dart-flutter-leicht-gemacht/learn/lecture/28467990#search
      verifyNoMoreInteractions(mockIdeaDao);
    });

    //...
  });

  group("addIdea", () {
    test("should create an idea entry", () async {
      late String title;
      late String description;

      // this variable simulates the idea database
      late int ideaCount = 0;

      // arrange
      when(mockIdeaDao.findIdeaByTitle(any))
          .thenAnswer((realInvocation) => const Stream.empty());
      when(mockIdeaDao.insertIdea(any)).thenAnswer((realInvocation) async {
        ideaCount++;
      });
      when(mockIdeaDao.countAll()).thenAnswer((_) async => ideaCount);

      // act
      final count1 = await ideaUseCases.countIdeas();
      final result = await ideaUseCases.addIdea(1, "test1", "test2");
      final count2 = await ideaUseCases.countIdeas();

      // verify
      expect(result, true);
      expect(count1, 0);
      expect(count2, 1);
    });
  });
}
