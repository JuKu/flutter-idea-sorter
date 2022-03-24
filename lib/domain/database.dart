// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_idea_sorter/domain/entities/idea_entity.dart';
import 'package:flutter_idea_sorter/domain/repositories/idea_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// build database: flutter packages pub run build_runner build
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Idea])
abstract class AppDatabase extends FloorDatabase {
  IdeaDao get studentDao;
}