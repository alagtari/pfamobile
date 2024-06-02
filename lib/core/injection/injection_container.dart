import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/common_used/dio_provider.dart';
import 'package:mobile/core/common_used/socket_service.dart';
import 'package:mobile/features/admin/problem/data/data_sources/problem_remote_data_source.dart';
import 'package:mobile/features/admin/problem/data/repositories/problem_repository_impl.dart';
import 'package:mobile/features/admin/problem/domain/repositories/problem_repository.dart';
import 'package:mobile/features/auth/data/data_sources/remote_data_source.dart';
import 'package:mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/features/citizen/calendar/data/data_sources/calendar_remote_data_source.dart';
import 'package:mobile/features/citizen/calendar/data/repositories/calendar_repository_impl.dart';
import 'package:mobile/features/citizen/calendar/domain/repositories/calendar_repository.dart';
import 'package:mobile/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:mobile/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:mobile/features/admin/city/data/data_sources/city_remote_data_source.dart';
import 'package:mobile/features/admin/city/data/repositories/city_repository_impl.dart';
import 'package:mobile/features/admin/city/domain/repositories/city_repository.dart';
import 'package:mobile/features/admin/driver/data/data_sources/driver_remote_data_source.dart';
import 'package:mobile/features/admin/driver/data/repositories/driver_repository_impl.dart';
import 'package:mobile/features/admin/driver/domain/repositories/driver_repository.dart';
import 'package:mobile/features/admin/plan/data/data_sources/plan_remote_data_source.dart';
import 'package:mobile/features/admin/plan/data/repositories/plan_repository_impl.dart';
import 'package:mobile/features/admin/plan/domain/repositories/plan_repository.dart';
import 'package:mobile/features/admin/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:mobile/features/admin/profile/data/repositories/profile_repository_impl.dart';
import 'package:mobile/features/admin/profile/domain/repositories/profile_repository.dart';
import 'package:mobile/features/citizen/problem/data/data_sources/problem_remote_data_source.dart';
import 'package:mobile/features/citizen/problem/data/repositories/problem_repository_impl.dart';
import 'package:mobile/features/citizen/problem/domain/repositories/problem_repository.dart';
import 'package:mobile/features/driver/home/data/data_sources/plan_remote_data_source.dart';
import 'package:mobile/features/driver/home/data/repositories/driver_plan_repository_impl.dart';
import 'package:mobile/features/driver/home/domain/repositories/driver_plan_repository.dart';
import 'package:mobile/features/driver/incident/data/data_sources/incident_remote_data_source.dart';
import 'package:mobile/features/driver/incident/data/repositories/incident_repository_impl.dart';
import 'package:mobile/features/driver/incident/domain/repositories/incident_repository.dart';
import 'package:mobile/features/driver/misson/data/data_sources/misson_remote_data_source.dart';
import 'package:mobile/features/driver/misson/data/repositories/misson_repository_impl.dart';
import 'package:mobile/features/driver/misson/domain/repositories/misson_repository.dart';
import 'package:mobile/features/signup/data/data_sources/signup_remote_data_source.dart';
import 'package:mobile/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:mobile/features/signup/domain/repositories/signup_repository.dart';
import 'package:mobile/features/admin/truck/data/data_sources/truck_remote_data_source.dart';
import 'package:mobile/features/admin/truck/data/repositories/truck_repository_impl.dart';
import 'package:mobile/features/admin/truck/domain/repositories/truck_repository.dart';
import 'package:mobile/l10n/bloc/language_bloc.dart';
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
  sl.registerLazySingleton<LanguageBloc>(
    () => LanguageBloc(),
  );
  sl.registerLazySingleton<Dio>(
    () => DioProvider.instance(),
  );
  sl.registerLazySingleton<SocketService>(
    () => SocketService(),
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

  sl.registerLazySingleton<SignupOnlineDataSource>(
    () => SignupOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ChatOnlineDataSource>(
    () => ChatOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(dataSource: sl()),
  );

  sl.registerLazySingleton<DriverPlanOnlineDataSource>(
    () => DriverPlanOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<DriverPlanRepository>(
    () => DriverPlanRepositoryImpl(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<MissionOnlineDataSource>(
    () => MissionOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<MissionRepository>(
    () => MissionRepositoryImpl(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IncidentOnlineDataSource>(
    () => IncidentOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<IncidentRepository>(
    () => IncidentRepositoryImpl(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ProblemOnlineDataSource>(
    () => ProblemOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<ProblemRepository>(
    () => ProblemRepositoryImpl(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<CalendarOnlineDataSource>(
    () => CalendarOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<CalendarRepository>(
    () => CalendarRepositoryImpl(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<AdminProblemOnlineDataSource>(
    () => AdminProblemOnlineDataSourceImpl(),
  );
  sl.registerLazySingleton<AdminProblemRepository>(
    () => AdminProblemRepositoryImpl(
      dataSource: sl(),
    ),
  );
}
