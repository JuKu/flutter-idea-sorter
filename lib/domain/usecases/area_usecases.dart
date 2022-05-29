import 'package:flutter_idea_sorter/domain/models/area_model.dart';
import 'package:flutter_idea_sorter/domain/repositories/area_repository.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';

class AreaUseCases {
  final AreaRepository areaRepository;

  AreaUseCases({required this.areaRepository});

  /// This method checks, if minimum one area exists
  Future<bool> hasAreas() async {
    final areas = await areaRepository.countAll();
    return (await areaRepository.countAll()) > 0;
  }

  /// This method creates the default area, if no area exists
  Future<void> createDefaultAreaIfAbsent() async {
    if (!(await hasAreas())) {
      /// no area exists, so create the default area
      final Area defaultArea = Area(1, "default");
      areaRepository.insertArea(defaultArea);
    }
  }

  Future<int?> getSelectedAreaID() async {
    this.createDefaultAreaIfAbsent();

    /// TODO: load from shared preferences
    return (await areaRepository.findAllAreas()).first.id;
  }

  void saveSelectedArea(int areaID) {
    /// TODO: save to shared preferences
  }

  Future<List<AreaModel>> listAllAreas() async {
    return (await areaRepository.findAllAreas())
        .map((area) => AreaModel(areaID: area.id, title: area.title))
        .toList();
  }

  Future<AreaModel?> getAreaModelById(int areaID) async {
    final area = areaRepository.findAreaById(areaID);

    if (area == null) {
      return null;
    }

    return area
        .map((area) => AreaModel(areaID: area!.id, title: area.title))
        .first;
  }
}
