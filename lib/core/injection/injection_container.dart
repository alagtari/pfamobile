import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/common_used/dio_provider.dart';
import 'package:mobile/features/auth/login/data/data_sources/remote_data_source.dart';
import 'package:mobile/features/auth/login/data/repositories/auth_repository_impl.dart';
import 'package:mobile/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<AppPrefs>(
    () => AppPrefs(prefs),
  );
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
  sl.registerLazySingleton<Dio>(
    () => DioProvider.instance(),
  );
  sl.registerLazySingleton<AuthOnlineDataSource>(
    () => AuthOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      dataSource: sl(),
    ),
  );
}
