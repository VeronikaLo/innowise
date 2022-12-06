import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_assesment/core/network_connaction/network_connection.dart';
import 'package:test_assesment/src/data/datasources/local_datasource.dart';
import 'package:test_assesment/src/data/datasources/remote_datasource.dart';
import 'package:test_assesment/src/data/repositories/pokemon_repository_impl.dart';
import 'package:test_assesment/src/domain/repositories/pokemon_repository.dart';
import 'package:test_assesment/src/domain/usecases/usecase.dart';
import 'package:test_assesment/src/presentation/bloc/bloc_list/test_bloc_bloc.dart';
import 'package:test_assesment/src/presentation/bloc/cubit/pokemon_cubit.dart';
import 'package:test_assesment/src/presentation/bloc/nav_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Presentation
  sl.registerFactory(() => TestBlocBloc(usecases: sl()));
  sl.registerFactory(() => PokemonCubit(usecases: sl()));
  sl.registerFactory(() => NavCubit(pokemonCubit: sl()));

  //Usecases
  sl.registerLazySingleton(() => UseCases(pokemonRepository: sl()));

  //Repository
  sl.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkConnection: sl(),
      ));

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: http.Client(), //sl(),
    ),
  );

  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: sl()),
  );

  // core
  sl.registerLazySingleton<NetworkConnection>(() => NetworkConnectionImp(sl()));

  // other packages
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
