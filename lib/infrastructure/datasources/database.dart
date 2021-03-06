// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/infrastructure/datasources/converters/area_syncmode_converter.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/area_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/area_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// build database: flutter packages pub run build_runner build
part 'database.g.dart'; // the generated code will be there

@TypeConverters([SyncModeConverter])
@Database(version: 1, entities: [Idea, Area])
abstract class AppDatabase extends FloorDatabase {
  IdeaDao get ideaDao;
  AreaDao get areaDao;
}
