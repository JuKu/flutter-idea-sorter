import 'package:flutter_idea_sorter/domain/repositories/area_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_idea_sorter/infrastructure/repositories/area_dao.dart';
import 'package:mockito/annotations.dart';

import 'area_repository_test.mocks.dart';

@GenerateMocks([AreaDao])
void main() {
  late MockAreaDao areaDao;
  late AreaRepository areaRepository;

  setUp(() async {
    areaDao = MockAreaDao();
    areaRepository = AreaRepository(areaDao: areaDao);
  });

  group("findAllAreas()", () {
    test("should return an empty list, if no area exists", () async {
      /// arrange
      when(areaDao.findAllAreas()).thenAnswer((realInvocation) async => []);

      /// act
      final result = await areaRepository.findAllAreas();

      /// verify
      verify(areaDao.findAllAreas());
      expect(result, []);
    });
  });
}
