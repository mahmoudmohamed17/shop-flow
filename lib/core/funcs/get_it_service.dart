import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_flow/core/services/api_service.dart';
import 'package:shop_flow/core/services/app_database.dart';
import 'package:shop_flow/core/services/firebase_auth_service.dart';
import 'package:shop_flow/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:shop_flow/features/auth/domain/repositories/auth_repo.dart';
import 'package:shop_flow/features/home/data/datasources/home_local_datasource.dart';
import 'package:shop_flow/features/home/data/datasources/home_remote_data_source.dart';
import 'package:shop_flow/features/home/data/repositories/home_repo_impl.dart';
import 'package:shop_flow/features/home/domain/repositories/home_repo.dart';

final getIt = GetIt.instance;

void getItService() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<FirebaseAuthService>()));
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDatasource: HomeLocalDatasourceImpl()));
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}
