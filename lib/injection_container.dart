import 'package:get_it/get_it.dart';
import 'package:square/core/network/network_info.dart';
import 'package:square/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:square/features/authentication/data/repositories/authentication_repository.dart';
import 'package:square/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:square/features/authentication/domain/usecases/login_usecase.dart';
import 'package:square/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:http/http.dart' as http;
import 'package:square/features/entreprise/data/datasources/entreprise_remote_source.dart';
import 'package:square/features/entreprise/data/repositories/entreprise_repository.dart';
import 'package:square/features/entreprise/domain/repositories/entreprise_repository.dart';
import 'package:square/features/entreprise/domain/usecases/add_entreprise.dart';
import 'package:square/features/entreprise/domain/usecases/get_all_entreprise.dart';
import 'package:square/features/entreprise/presentation/bloc/entreprise_bloc.dart';
import 'package:square/features/entreprise/presentation/bloc/entreprise_crud/entreprise_crud_bloc_bloc.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

//Dependency injection
Future<void> init() async {
  //Blocs
  sl.registerFactory(
    () => AuthenticationBloc(
      sl(),
      //fetchToken: sl(),
    )..add(CheckLoginStatusEvent()),
  );

  sl.registerFactory(() => EntrepriseBloc(sl()));

  sl.registerFactory(() => EntrepriseCrudBloc(addEntrepriseUseCase: sl()));

  //Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => GetAllEntrepriseUserCase(sl()));
  sl.registerLazySingleton(() => AddEntrepriseUseCase(sl()));

  //Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<EntrepriseRepository>(
    () => EntrepriseRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  //Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<EntrepriseRemoteDataSource>(
    () => EntrepriseRemoteSourceImpl(
      client: sl(),
    ),
  );

  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(dataConnectionChecker: sl()),
  );

  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton(() => http.Client());
}
