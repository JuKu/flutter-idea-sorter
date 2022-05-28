import 'package:dartz/dartz.dart';
import 'package:flutter_idea_sorter/domain/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/domain/repositories/idea_dao.dart';

class IdeaUseCases {
  final IdeaDao ideaDao;

  IdeaUseCases({required this.ideaDao});

  Future<bool> addIdea(int areaId, String title, String description) async {
    late Idea idea = Idea(-1, title, description, areaId);
    ideaDao.insertIdea(idea);

    return true;
  }

  Future<int?> countIdeas() async {
    return ideaDao.countAll();
  }
}
