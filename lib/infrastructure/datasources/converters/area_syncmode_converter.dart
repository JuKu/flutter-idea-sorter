import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';

class SyncModeConverter extends TypeConverter<SyncMode, int> {
  @override
  SyncMode decode(int databaseValue) {
    return SyncMode.values[databaseValue];
  }

  @override
  int encode(SyncMode value) {
    return value.index;
  }
}
