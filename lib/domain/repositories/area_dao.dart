import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/domain/entities/idea_entity.dart';

@dao
abstract class AreaDao {
  @Query('SELECT * FROM areas')
  Future<List<Idea>> findAllAreas();

  @Query('SELECT * FROM areas WHERE id = :id')
  Stream<Idea?> findAreaById(int id);

  @insert
  Future<void> insertArea(Idea idea);

  @Query('DELETE FROM areas WHERE id = :id')
  Future<void> delete(int id);
}
