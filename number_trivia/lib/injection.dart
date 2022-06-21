import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:number_trivia/core/network/networking_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local/user_local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/remote/user_remote_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/user_repository_imp.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/login/login.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/logout/logout.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/register_user/register_user.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => UserBloc(
      loginImp: sl(),
      logoutImp: sl(),
      registerUserImp: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginImp(userRepository: sl()));
  sl.registerLazySingleton(() => LogoutImp(userRepository: sl()));
  sl.registerLazySingleton(() => RegisterUserImp(userRepository: sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(client: sl()));

  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
