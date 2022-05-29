import 'package:dartz/dartz.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';

class IdeaUseCases {
  final IdeaDao ideaDao;

  IdeaUseCases({required this.ideaDao});

  Future<bool> addIdea(int areaId, String title, String description) async {
    // TODO: replace direct database access with repository calls

    // first, check if idea title already exists
    if ((await (ideaDao.findIdeaByTitle(title).length)) > 0) {
      /// idea title already exists
      return false;
    }

    late Idea idea = Idea(-1, title, description, areaId);
    ideaDao.insertIdea(idea);

    return true;
  }

  Future<int?> countIdeas() async {
    return ideaDao.countAll();
  }
}
