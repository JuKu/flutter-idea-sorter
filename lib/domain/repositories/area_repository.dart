import 'package:flutter_idea_sorter/infrastructure/datasources/database.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/area_dao.dart';
import 'package:get_it/get_it.dart';

class AreaRepository {
  late AreaDao _areaDao;

  AreaRepository({AreaDao? areaDao}) {
    if (areaDao != null) {
      _areaDao = areaDao;
      return;
    }

    if (!GetIt.instance.isReadySync<AreaDao>()) {
      throw Exception(
          "AreaDAO is not ready - this means database was not initialized correctly");
    }
    _areaDao = GetIt.instance.get<AreaDao>();
  }

  Future<List<Area>> findAllAreas() {
    return _areaDao.findAllAreas();
  }

  Stream<Area?> findAreaById(int id) {
    return _areaDao.findAreaById(id);
  }

  Future<void> insertArea(Area area) {
    return _areaDao.insertArea(area);
  }

  Future<void> delete(int id) {
    return _areaDao.delete(id);
  }

  Future<int> countAll() async {
    final list = await _areaDao.findAllAreas();
    final count = list.toList().length;

    return count;
  }
}
