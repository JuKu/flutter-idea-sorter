import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/logger.util.dart';
import 'package:get_it/get_it.dart';

class IdeaRepository {
  late IdeaDao _ideaDao;

  IdeaRepository() {
    if (!GetIt.instance.isReadySync<IdeaDao>()) {
      throw Exception(
          "IdeaDAO is not ready - this means database was not initialized correctly");
    }
    _ideaDao = GetIt.instance.get<IdeaDao>();

    if (_ideaDao == null) {
      getLogger().e("_ideaDao is null");
    }
  }

  Future<List<Idea>> findAllIdeas() {
    return _ideaDao.findAllIdeas();
  }

  Future<List<Idea>> findAllIdeasByArea(int areaID) {
    return _ideaDao.findAllIdeasByArea(areaID);
  }

  Stream<Idea?> findIdeaById(int id) {
    return _ideaDao.findIdeaById(id);
  }

  Future<void> insertIdea(Idea idea) async {
    if (idea.areaId < 1) {
      throw Exception("idea areaID cannot be < 1");
    }

    // get latest id
    final Idea? lastIdea = await _ideaDao.getNewestGlobalIdea();
    final int lastID = lastIdea == null ? 0 : lastIdea.id;
    final Idea ideaCopy =
        Idea(lastID + 1, idea.title, idea.description, idea.areaId);

    /// getLogger().d("insert idea: ${idea.toString()}");
    return await _ideaDao.insertIdea(ideaCopy);
  }

  Future<void> delete(int id) {
    return _ideaDao.delete(id);
  }

  Future<int> countAll() async {
    final list = await _ideaDao.findAllIdeas();
    final count = list.toList().length;

    return count;
  }
}
