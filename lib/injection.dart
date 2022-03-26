import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  /// BLOCS

  // factory means, that every call sl creates a new instance of the dependency
  //sl.registerFactory(() => null)

  /// Usecases
  // sl.registerLazySingleton(() => null);

  /// repos

  /// datasources

  /// extern
  sl.registerLazySingleton(() => http.Client());
}
