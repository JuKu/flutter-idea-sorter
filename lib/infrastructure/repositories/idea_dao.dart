import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';

@dao
abstract class IdeaDao {
  @Query('SELECT * FROM ideas')
  Future<List<Idea>> findAllIdeas();

  @Query('SELECT * FROM ideas WHERE area_id = :areaID')
  Future<List<Idea>> findAllIdeasByArea(int areaID);

  @Query('SELECT * FROM ideas WHERE id = :id')
  Stream<Idea?> findIdeaById(int id);

  @Query('SELECT * FROM ideas WHERE title = :title')
  Stream<Idea?> findIdeaByTitle(String title);

  @insert
  Future<void> insertIdea(Idea idea);

  @Query('DELETE FROM ideas WHERE id = :id')
  Future<void> delete(int id);

  @Query('Select * from ideas order by id desc limit 1')
  Future<Idea?> getNewestGlobalIdea();

  @Query('SELECT COUNT(*) FROM ideas')
  Future<int?> countAll();
}
