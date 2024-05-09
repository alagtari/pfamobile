import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/common_used/dio_provider.dart';
import 'package:mobile/features/auth/data/data_sources/remote_data_source.dart';
import 'package:mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/features/city/data/data_sources/city_remote_data_source.dart';
import 'package:mobile/features/city/data/repositories/city_repository_impl.dart';
import 'package:mobile/features/city/domain/repositories/city_repository.dart';
import 'package:mobile/features/driver/data/data_sources/driver_remote_data_source.dart';
import 'package:mobile/features/driver/data/repositories/driver_repository_impl.dart';
import 'package:mobile/features/driver/domain/repositories/driver_repository.dart';
import 'package:mobile/features/plan/data/data_sources/plan_remote_data_source.dart';
import 'package:mobile/features/plan/data/repositories/plan_repository_impl.dart';
import 'package:mobile/features/plan/domain/repositories/plan_repository.dart';
import 'package:mobile/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:mobile/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:mobile/features/profile/domain/repositories/profile_repository.dart';
import 'package:mobile/features/truck/data/data_sources/truck_remote_data_source.dart';
import 'package:mobile/features/truck/data/repositories/truck_repository_impl.dart';
import 'package:mobile/features/truck/domain/repositories/truck_repository.dart';
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

  sl.registerLazySingleton<DriverOnlineDataSource>(
    () => DriverOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<DriverRepository>(
    () => DriverRepositoryImpl(
      dataSource: sl(),
    ),
  );
  sl.registerLazySingleton<TruckOnlineDataSource>(
    () => TruckOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<TruckRepository>(
    () => TruckRepositoryImpl(
      dataSource: sl(),
    ),
  );
  sl.registerLazySingleton<CityOnlineDataSource>(
    () => CityOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      dataSource: sl(),
    ),
  );
  sl.registerLazySingleton<PlanOnlineDataSource>(
    () => PlanOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<PlanRepository>(
    () => PlanRepositoryImpl(
      dataSource: sl(),
    ),
  );

   sl.registerLazySingleton<ProfileOnlineDataSource>(
    () => ProfileOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      dataSource: sl(),
    ),
  );
}
