// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  IdeaDao? _ideaDaoInstance;

  AreaDao? _areaDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ideas` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `area_id` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `iconName` TEXT NOT NULL, FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `areas` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `title` TEXT NOT NULL, `syncEnabled` INTEGER NOT NULL, `syncMode` INTEGER NOT NULL)');
        await database.execute(
            'CREATE INDEX `index_ideas_area_id` ON `ideas` (`area_id`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  IdeaDao get ideaDao {
    return _ideaDaoInstance ??= _$IdeaDao(database, changeListener);
  }

  @override
  AreaDao get areaDao {
    return _areaDaoInstance ??= _$AreaDao(database, changeListener);
  }
}

class _$IdeaDao extends IdeaDao {
  _$IdeaDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _ideaInsertionAdapter = InsertionAdapter(
            database,
            'ideas',
            (Idea item) => <String, Object?>{
                  'id': item.id,
                  'area_id': item.areaId,
                  'title': item.title,
                  'description': item.description,
                  'iconName': item.iconName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Idea> _ideaInsertionAdapter;

  @override
  Future<List<Idea>> findAllIdeas() async {
    return _queryAdapter.queryList('SELECT * FROM ideas',
        mapper: (Map<String, Object?> row) => Idea(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['iconName'] as String,
            row['area_id'] as int));
  }

  @override
  Future<List<Idea>> findAllIdeasByArea(int areaID) async {
    return _queryAdapter.queryList('SELECT * FROM ideas WHERE area_id = ?1',
        mapper: (Map<String, Object?> row) => Idea(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['iconName'] as String,
            row['area_id'] as int),
        arguments: [areaID]);
  }

  @override
  Stream<Idea?> findIdeaById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM ideas WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Idea(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['iconName'] as String,
            row['area_id'] as int),
        arguments: [id],
        queryableName: 'ideas',
        isView: false);
  }

  @override
  Stream<Idea?> findIdeaByTitle(String title) {
    return _queryAdapter.queryStream('SELECT * FROM ideas WHERE title = ?1',
        mapper: (Map<String, Object?> row) => Idea(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['iconName'] as String,
            row['area_id'] as int),
        arguments: [title],
        queryableName: 'ideas',
        isView: false);
  }

  @override
  Future<void> delete(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM ideas WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<Idea?> getNewestGlobalIdea() async {
    return _queryAdapter.query('Select * from ideas order by id desc limit 1',
        mapper: (Map<String, Object?> row) => Idea(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['iconName'] as String,
            row['area_id'] as int));
  }

  @override
  Future<int?> countAll() async {
    await _queryAdapter.queryNoReturn('SELECT COUNT(*) FROM ideas');
  }

  @override
  Future<void> insertIdea(Idea idea) async {
    await _ideaInsertionAdapter.insert(idea, OnConflictStrategy.abort);
  }
}

class _$AreaDao extends AreaDao {
  _$AreaDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _areaInsertionAdapter = InsertionAdapter(
            database,
            'areas',
            (Area item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'syncEnabled': item.syncEnabled ? 1 : 0,
                  'syncMode': _syncModeConverter.encode(item.syncMode)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Area> _areaInsertionAdapter;

  @override
  Future<List<Area>> findAllAreas() async {
    return _queryAdapter.queryList('SELECT * FROM areas',
        mapper: (Map<String, Object?> row) => Area(
            row['id'] as int,
            row['title'] as String,
            (row['syncEnabled'] as int) != 0,
            _syncModeConverter.decode(row['syncMode'] as int)));
  }

  @override
  Stream<Area?> findAreaById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM areas WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Area(
            row['id'] as int,
            row['title'] as String,
            (row['syncEnabled'] as int) != 0,
            _syncModeConverter.decode(row['syncMode'] as int)),
        arguments: [id],
        queryableName: 'areas',
        isView: false);
  }

  @override
  Future<void> delete(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM areas WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<int?> countAll() async {
    await _queryAdapter.queryNoReturn('SELECT COUNT(*) FROM areas');
  }

  @override
  Future<void> insertArea(Area area) async {
    await _areaInsertionAdapter.insert(area, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _syncModeConverter = SyncModeConverter();
