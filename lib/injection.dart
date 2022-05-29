import 'package:flutter_idea_sorter/application/datastate/data_state_bloc.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/area_dao.dart';
import 'package:flutter_idea_sorter/infrastructure/repositories/idea_dao.dart';
import 'package:flutter_idea_sorter/domain/usecases/idea_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'infrastructure/datasources/database.dart';

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  /// BLOCS
  /*sl.registerSingletonWithDependencies<DataStateBloc>(() {
    //IdeaUseCases ideaUseCases = GetIt.instance.get<IdeaUseCases>();
    return DataStateBloc(ideaUseCases: sl());
  }, dependsOn: [IdeaUseCases]);*/
  sl.registerLazySingleton(() => DataStateBloc(ideaUseCases: sl()));

  // factory means, that every call sl creates a new instance of the dependency
  //sl.registerFactory(() => null)

  /// Usecases
  // sl.registerLazySingleton(() => null);
  sl.registerLazySingleton<IdeaUseCases>(() => IdeaUseCases(ideaDao: sl()));

  /// repos

  /// datasources
  /*AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('ideamanagement.db').build();*/

  /// see also: https://github.com/fluttercommunity/get_it/issues/99
  sl.registerLazySingletonAsync<AppDatabase>(() async =>
      $FloorAppDatabase.databaseBuilder('ideamanagement.db').build());
  /*sl.registerLazySingleton(() => database.ideaDao);
  sl.registerLazySingleton(() => database.areaDao);*/

  /// Register all DAOs.
  sl.registerSingletonWithDependencies<IdeaDao>(() {
    return GetIt.instance.get<AppDatabase>().ideaDao;
  }, dependsOn: [AppDatabase]);
  sl.registerSingletonWithDependencies<AreaDao>(() {
    return GetIt.instance.get<AppDatabase>().areaDao;
  }, dependsOn: [AppDatabase]);

  /// extern
  sl.registerLazySingleton(() => http.Client());
}
