import 'package:authentication_sample/Authentication/data/data_sources/AuthenticationLocalDataSource.dart';
import 'package:authentication_sample/Authentication/data/repositories/AuthenticationRepositoryImpl.dart';
import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/CurrentUser.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/GetProfile.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/IsLoggedIn.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/Login.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/Logout.dart';
import 'package:authentication_sample/Authentication/presentation/manager/AuthenticationProvider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'Authentication/data/data_sources/AuthenticationRemoteDataSource.dart';
import 'core/NetworkInfo/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Feature
  authentication;

  ///Core
  core;

  ///External
  external;
}

void get authentication {
  //provider
  sl.registerFactory(
    () => AuthenticationProvider(
      currentUser: sl(),
      getProfile: sl(),
      isLoggedIn: sl(),
      login: sl(),
      logout: sl(),
    ),
  );

  //Use cases
  sl.registerLazySingleton(() => CurrentUser(sl()));
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerLazySingleton(() => IsLoggedIn(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  //repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  //Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSourceImpl>(
    () => AuthenticationRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthenticationLocalDataSourceImpl>(
    () => AuthenticationLocalDataSourceImpl(),
  );
}

void get core {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

void get external {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
