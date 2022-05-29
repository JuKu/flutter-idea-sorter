import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';

@dao
abstract class AreaDao {
  @Query('SELECT * FROM areas')
  Future<List<Area>> findAllAreas();

  @Query('SELECT * FROM areas WHERE id = :id')
  Stream<Area?> findAreaById(int id);

  @insert
  Future<void> insertArea(Area area);

  @Query('DELETE FROM areas WHERE id = :id')
  Future<void> delete(int id);

  @Query('SELECT COUNT(*) FROM areas')
  Future<int?> countAll();
}
