import 'package:flutter_idea_sorter/application/area_selection/area_selection_bloc.dart';
import 'package:flutter_idea_sorter/application/datastate/data_state_bloc.dart';
import 'package:flutter_idea_sorter/domain/repositories/area_repository.dart';
import 'package:flutter_idea_sorter/domain/repositories/idea_repository.dart';
import 'package:flutter_idea_sorter/domain/usecases/area_usecases.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/area_dao.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'infrastructure/datasources/database.dart';

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  // Register our database first.
  sl.registerLazySingletonAsync<AppDatabase>(() async =>
      $FloorAppDatabase.databaseBuilder('ideamanagement.db').build());

  sl.registerSingletonWithDependencies<AreaDao>(() {
    return sl.get<AppDatabase>().areaDao;
  }, dependsOn: [AppDatabase]);
  sl.registerSingletonWithDependencies<IdeaDao>(() {
    return sl.get<AppDatabase>().ideaDao;
  }, dependsOn: [AppDatabase]);

  /// BLOCS

  // factory means, that every call sl creates a new instance of the dependency
  //sl.registerFactory(() => null)

  sl.registerSingletonWithDependencies<AreaRepository>(() => AreaRepository(),
      dependsOn: [AppDatabase, AreaDao]);

  sl.registerSingletonWithDependencies<IdeaRepository>(() => IdeaRepository(),
      dependsOn: [AppDatabase, IdeaDao]);

  /// Usecases
  // sl.registerLazySingleton(() => null);
  sl.registerLazySingleton<IdeaUseCases>(
      () => IdeaUseCases(ideaDao: sl(), ideaRepository: sl()));
  sl.registerSingletonWithDependencies<AreaUseCases>(
      () => AreaUseCases(areaRepository: sl<AreaRepository>()),
      dependsOn: [AreaRepository]);

  /// repos

  /// datasources
  /// see also: https://github.com/fluttercommunity/get_it/issues/99
  /*sl.registerLazySingletonAsync<AppDatabase>(() async =>
      $FloorAppDatabase.databaseBuilder('ideamanagement.db').build());*/
  /*sl.registerLazySingleton(() => database.ideaDao);
  sl.registerLazySingleton(() => database.areaDao);*/

  /// Register all DAOs.

  /// extern
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => DataStateBloc(ideaUseCases: sl()));
  sl.registerSingletonWithDependencies(
      () => AreaSelectionBloc(areaUseCases: sl()),
      dependsOn: [AreaUseCases]);
}
