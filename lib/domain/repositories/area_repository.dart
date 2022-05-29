import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/area_dao.dart';
import 'package:get_it/get_it.dart';

class AreaRepository {
  late AreaDao _areaDao;

  AreaRepository() {
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

  Future<int?> countAll() {
    return _areaDao.countAll();
  }
}
