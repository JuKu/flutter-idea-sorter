import 'package:flutter_idea_sorter/domain/repositories/area_repository.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';

class AreaUseCases {
  final AreaRepository areaRepository;

  AreaUseCases({required this.areaRepository});

  /// This method checks, if minimum one area exists
  Future<bool> hasAreas() async {
    final areas = await areaRepository.countAll();
    return (await areaRepository.countAll())! > 0;
  }

  /// This method creates the default area, if no area exists
  Future<void> createDefaultAreaIfAbsent() async {
    if (!(await hasAreas())) {
      /// no area exists, so create the default area
      final Area defaultArea = Area(1, "default");
      areaRepository.insertArea(defaultArea);
    }
  }

  String? getSelectedArea() {
    return null;
  }

  void setSelectedArea(String newArea) {
    //
  }
}
