import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_app/core/network/networking_info.dart';
import 'package:task_app/features/task_app/data/datasources/local/user_local_datasource.dart';
import 'package:task_app/features/task_app/data/datasources/remote/user_remote_datasource.dart';
import 'package:task_app/features/task_app/data/repositories/user_repository_imp.dart';
import 'package:task_app/features/task_app/domain/repositories/user_repository.dart';
import 'package:task_app/features/task_app/domain/usecases/login/login.dart';
import 'package:task_app/features/task_app/domain/usecases/logout/logout.dart';
import 'package:task_app/features/task_app/domain/usecases/register_user/register_user.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
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
    () => UserRemoteDataSourceImp(
      client: sl(),
      sharedPreferences: sl(),
    ),
  );

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
