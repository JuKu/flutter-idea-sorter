import 'package:flutter_idea_sorter/domain/models/area_model.dart';
import 'package:flutter_idea_sorter/domain/repositories/area_repository.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      final Area defaultArea = Area(1, "default", false, SyncMode.none);
      areaRepository.insertArea(defaultArea);
    }
  }

  Future<int?> getSelectedAreaID() async {
    await this.createDefaultAreaIfAbsent();

    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    /// load from shared preferences
    int selectedAreaID = prefs.getInt("selected_area") ?? -1;
    print("selected area loaded from shared preferences: $selectedAreaID");

    if (selectedAreaID == -1) {
      selectedAreaID = (await areaRepository.findAllAreas()).first.id;
    }

    return selectedAreaID;
  }

  void saveSelectedArea(int areaID) async {
    /// save to shared preferences
    print("save selected area: $areaID");

    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt("selected_area", areaID);
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
