import 'package:dartz/dartz.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/logger.util.dart';

import 'package:flutter_idea_sorter/logger.util.dart';
import 'package:logger/logger.dart';

class IdeaUseCases {
  final IdeaDao ideaDao;
  final Logger logger = getLogger();

  IdeaUseCases({required this.ideaDao});

  Future<bool> addIdea(int areaId, String title, String description) async {
    logger.i(
        "try to create new idea, title: $title, description: $description, areaID: $areaId");

    // TODO: replace direct database access with repository calls

    // first, check if idea title already exists
    if ((await (ideaDao.findIdeaByTitle(title).length)) > 0) {
      logger.w(
          "cannot create idea, because idea with this title already exists: $title");

      /// idea title already exists
      return false;
    }

    late Idea idea = Idea(-1, title, description, areaId);
    ideaDao.insertIdea(idea);

    logger.i(
        "created idea successfully (title: $title, description: $description");

    return true;
  }

  Future<int?> countIdeas() async {
    return ideaDao.countAll();
  }
}
