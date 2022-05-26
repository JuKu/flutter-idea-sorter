import 'package:dartz/dartz.dart';
import 'package:flutter_idea_sorter/domain/repositories/idea_dao.dart';

class IdeaUseCases {
  final IdeaDao ideaDao;

  IdeaUseCases({required this.ideaDao});

  Future<bool> addIdea(String title, String description) async {
    return false;
  }

  Future<int?> countIdeas() async {
    return ideaDao.countAll();
  }
}
