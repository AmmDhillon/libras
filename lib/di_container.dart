import 'package:dio/dio.dart';
import 'package:flpapp/api_constants.dart';
import 'package:flpapp/remote/dio/dio_client.dart';
import 'package:flpapp/remote/dio/logging_interceptor.dart';
import 'package:flpapp/remote/provider/auth_provider.dart';
import 'package:flpapp/remote/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init(SharedPreferences sharedPreferences) async {

  // External
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  // Core
  sl.registerLazySingleton(() => DioClient(baseUrl: APIConstants.BASE_URL, dio: sl(), loggingInterceptor: sl()));

  // Repos
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => AuthProvider(authRepo: sl()));

}
