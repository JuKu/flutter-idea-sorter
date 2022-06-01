import 'package:dartz/dartz.dart';
import 'package:flutter_idea_sorter/domain/models/idea_overview_model.dart';
import 'package:flutter_idea_sorter/domain/repositories/idea_repository.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/logger.util.dart';

import 'package:flutter_idea_sorter/logger.util.dart';
import 'package:logger/logger.dart';

class IdeaUseCases {
  final IdeaDao ideaDao;
  final IdeaRepository ideaRepository;
  final Logger logger = getLogger();

  IdeaUseCases({required this.ideaDao, required this.ideaRepository});

  Future<bool> addIdea(int areaId, String title, String description) async {
    logger.i(
        "try to create new idea, title: $title, description: $description, areaID: $areaId");

    try {
      late Idea idea = Idea(areaId, title, description, areaId);
      await ideaRepository.insertIdea(idea);
    } catch (e, s) {
      logger.w("cannot create idea: $e");
    }

    logger.i(
        "created idea successfully (title: $title, description: $description, areaID: $areaId, idea count after creation: ${await ideaRepository.countAll()}");

    return true;
  }

  Future<int?> countIdeas() async {
    return ideaRepository.countAll();
  }

  Future<List<IdeaOverviewModel>> listIdeaOverviewsByArea(
      final int areaID) async {
    return (await ideaRepository.findAllIdeasByArea(areaID))
        .map((idea) => IdeaOverviewModel(
            areaID: idea.areaId,
            ideaID: idea.id,
            title: idea.title,
            description: idea.description))
        .toList();
  }
}
