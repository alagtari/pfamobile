// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i44;
import 'package:flutter/material.dart' as _i45;
import 'package:latlong2/latlong.dart' as _i51;
import 'package:mobile/features/admin/city/data/models/city_model.dart' as _i48;
import 'package:mobile/features/admin/city/presentation/views/add_city_screen.dart'
    as _i1;
import 'package:mobile/features/admin/city/presentation/views/cities_screen.dart'
    as _i13;
import 'package:mobile/features/admin/city/presentation/views/city_locations_screen.dart'
    as _i19;
import 'package:mobile/features/admin/city/presentation/views/update_city_screen.dart'
    as _i38;
import 'package:mobile/features/admin/city/presentation/views/verify_city_screen.dart'
    as _i43;
import 'package:mobile/features/admin/driver/data/models/driver_model.dart'
    as _i49;
import 'package:mobile/features/admin/driver/presentation/views/add_driver_screen.dart'
    as _i2;
import 'package:mobile/features/admin/driver/presentation/views/drivers_screen.dart'
    as _i27;
import 'package:mobile/features/admin/driver/presentation/views/update_driver_screen.dart'
    as _i39;
import 'package:mobile/features/admin/plan/data/models/plan_model.dart' as _i47;
import 'package:mobile/features/admin/plan/presentation/views/add_plan_screen.dart'
    as _i3;
import 'package:mobile/features/admin/plan/presentation/views/admin_misson_map_screen.dart'
    as _i9;
import 'package:mobile/features/admin/plan/presentation/views/plan_locations_screen.dart'
    as _i31;
import 'package:mobile/features/admin/plan/presentation/views/plans_screen.dart'
    as _i32;
import 'package:mobile/features/admin/profile/presentation/views/change_password_screen.dart'
    as _i11;
import 'package:mobile/features/admin/profile/presentation/views/change_prefrences_screen.dart'
    as _i12;
import 'package:mobile/features/admin/profile/presentation/views/profile_screen.dart'
    as _i33;
import 'package:mobile/features/admin/profile/presentation/views/update_general_information_screen.dart'
    as _i40;
import 'package:mobile/features/admin/truck/data/models/truck_model.dart'
    as _i50;
import 'package:mobile/features/admin/truck/presentation/views/add_truck_screen.dart'
    as _i4;
import 'package:mobile/features/admin/truck/presentation/views/trucks_screen.dart'
    as _i37;
import 'package:mobile/features/admin/truck/presentation/views/update_truck_screen.dart'
    as _i42;
import 'package:mobile/features/auth/presentation/views/forgot_password_code.dart'
    as _i28;
import 'package:mobile/features/auth/presentation/views/forgot_password_email.dart'
    as _i29;
import 'package:mobile/features/auth/presentation/views/login_screen.dart'
    as _i30;
import 'package:mobile/features/auth/presentation/views/reset_password.dart'
    as _i35;
import 'package:mobile/features/chat/data/models/room_model.dart' as _i46;
import 'package:mobile/features/chat/presentation/views/admin/admin_chat_room_screen.dart'
    as _i6;
import 'package:mobile/features/chat/presentation/views/admin/admin_chat_rooms_screen.dart'
    as _i7;
import 'package:mobile/features/chat/presentation/views/driver/driver_chat_room_screen.dart'
    as _i21;
import 'package:mobile/features/citizen/home/presentation/views/citizen_app_frame.dart'
    as _i14;
import 'package:mobile/features/citizen/problem/presentation/views/citizen_problem_screen.dart'
    as _i17;
import 'package:mobile/features/citizen/profile/presentation/views/citizen_profile_screen.dart'
    as _i18;
import 'package:mobile/features/driver/home/presentation/views/driver_app_frame.dart'
    as _i20;
import 'package:mobile/features/driver/home/presentation/views/driver_plan_locations_screen.dart'
    as _i24;
import 'package:mobile/features/driver/home/presentation/views/driver_plans_screen.dart'
    as _i25;
import 'package:mobile/features/driver/incident/presentation/views/driver_incident_screen.dart'
    as _i22;
import 'package:mobile/features/driver/misson/presentation/views/misson_map_screen.dart'
    as _i23;
import 'package:mobile/features/driver/profile/presentation/views/driver_profile_screen.dart'
    as _i26;
import 'package:mobile/features/signup/presentation/views/signup.dart' as _i36;
import 'package:mobile/files/admin_app_frame.dart' as _i5;
import 'package:mobile/files/admin_home_screen.dart' as _i8;
import 'package:mobile/files/category_screen.dart' as _i10;
import 'package:mobile/features/citizen/calendar/presentation/views/citizen_calendar_screen.dart' as _i15;
import 'package:mobile/files/citizen_home_screen.dart' as _i16;
import 'package:mobile/features/admin/problem/presentation/views/reports_screen.dart' as _i34;
import 'package:mobile/files/update_address_screen.dart' as _i41;

abstract class $AppRouter extends _i44.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i44.PageFactory> pagesMap = {
    AddCityRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i1.AddCityScreen()),
      );
    },
    AddDriverRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i2.AddDriverScreen()),
      );
    },
    AddPlanRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i3.AddPlanScreen()),
      );
    },
    AddTruckRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i4.AddTruckScreen()),
      );
    },
    AdminAppFrame.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AdminAppFrame(),
      );
    },
    AdminChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<AdminChatRoomRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i6.AdminChatRoomScreen(
          key: args.key,
          room: args.room,
        )),
      );
    },
    AdminChatRoomsRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i7.AdminChatRoomsScreen()),
      );
    },
    AdminHomeRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AdminHomeScreen(),
      );
    },
    AdminMissionMapRoute.name: (routeData) {
      final args = routeData.argsAs<AdminMissionMapRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.AdminMissionMapScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CategoryScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i11.ChangePasswordScreen()),
      );
    },
    ChangePreferencesRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i12.ChangePreferencesScreen()),
      );
    },
    CitiesRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i13.CitiesScreen()),
      );
    },
    CitizenAppFrame.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CitizenAppFrame(),
      );
    },
    CitizenCalendarRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.CitizenCalendarScreen(),
      );
    },
    CitizenHomeRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CitizenHomeScreen(),
      );
    },
    CitizenProblemRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i17.CitizenProblemScreen()),
      );
    },
    CitizenProfileRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.CitizenProfileScreen(),
      );
    },
    CityLocationsRoute.name: (routeData) {
      final args = routeData.argsAs<CityLocationsRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i19.CityLocationsScreen(
          key: args.key,
          city: args.city,
        )),
      );
    },
    DriverAppFrame.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.DriverAppFrame(),
      );
    },
    DriverChatRoomRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i21.DriverChatRoomScreen()),
      );
    },
    DriverIncidentRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i22.DriverIncidentScreen()),
      );
    },
    DriverMissionMapRoute.name: (routeData) {
      final args = routeData.argsAs<DriverMissionMapRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i23.DriverMissionMapScreen(
          key: args.key,
          plan: args.plan,
        )),
      );
    },
    DriverPlanLocationsRoute.name: (routeData) {
      final args = routeData.argsAs<DriverPlanLocationsRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.DriverPlanLocationsScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    DriverPlansRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i25.DriverPlansScreen()),
      );
    },
    DriverProfileRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.DriverProfileScreen(),
      );
    },
    DriversRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i27.DriversScreen()),
      );
    },
    ForgotPasswordCode.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordCodeArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i28.ForgotPasswordCode(
          key: args.key,
          email: args.email,
        )),
      );
    },
    ForgotPasswordEmail.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i29.ForgotPasswordEmail()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i30.LoginScreen()),
      );
    },
    PlanLocationsRoute.name: (routeData) {
      final args = routeData.argsAs<PlanLocationsRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.PlanLocationsScreen(
          key: args.key,
          plan: args.plan,
        ),
      );
    },
    PlansRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i32.PlansScreen()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.ProfileScreen(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.ReportsScreen(),
      );
    },
    ResetPassword.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i35.ResetPassword(
          key: args.key,
          code: args.code,
          email: args.email,
        )),
      );
    },
    Signup.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i36.Signup()),
      );
    },
    TrucksRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(child: const _i37.TrucksScreen()),
      );
    },
    UpdateCityRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCityRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i38.UpdateCityScreen(
          key: args.key,
          city: args.city,
        )),
      );
    },
    UpdateDriverRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateDriverRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i39.UpdateDriverScreen(
          key: args.key,
          driver: args.driver,
        )),
      );
    },
    UpdateGeneralInformationRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: const _i40.UpdateGeneralInformationScreen()),
      );
    },
    UpdateLocationRoute.name: (routeData) {
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.UpdateLocationScreen(),
      );
    },
    UpdateTruckRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTruckRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i42.UpdateTruckScreen(
          key: args.key,
          truck: args.truck,
        )),
      );
    },
    VerifyCityRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCityRouteArgs>();
      return _i44.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.WrappedRoute(
            child: _i43.VerifyCityScreen(
          key: args.key,
          location: args.location,
          name: args.name,
          state: args.state,
          postalCode: args.postalCode,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCityScreen]
class AddCityRoute extends _i44.PageRouteInfo<void> {
  const AddCityRoute({List<_i44.PageRouteInfo>? children})
      : super(
          AddCityRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCityRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddDriverScreen]
class AddDriverRoute extends _i44.PageRouteInfo<void> {
  const AddDriverRoute({List<_i44.PageRouteInfo>? children})
      : super(
          AddDriverRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDriverRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddPlanScreen]
class AddPlanRoute extends _i44.PageRouteInfo<void> {
  const AddPlanRoute({List<_i44.PageRouteInfo>? children})
      : super(
          AddPlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPlanRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AddTruckScreen]
class AddTruckRoute extends _i44.PageRouteInfo<void> {
  const AddTruckRoute({List<_i44.PageRouteInfo>? children})
      : super(
          AddTruckRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTruckRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminAppFrame]
class AdminAppFrame extends _i44.PageRouteInfo<void> {
  const AdminAppFrame({List<_i44.PageRouteInfo>? children})
      : super(
          AdminAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'AdminAppFrame';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AdminChatRoomScreen]
class AdminChatRoomRoute extends _i44.PageRouteInfo<AdminChatRoomRouteArgs> {
  AdminChatRoomRoute({
    _i45.Key? key,
    required _i46.RoomModel room,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          AdminChatRoomRoute.name,
          args: AdminChatRoomRouteArgs(
            key: key,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminChatRoomRoute';

  static const _i44.PageInfo<AdminChatRoomRouteArgs> page =
      _i44.PageInfo<AdminChatRoomRouteArgs>(name);
}

class AdminChatRoomRouteArgs {
  const AdminChatRoomRouteArgs({
    this.key,
    required this.room,
  });

  final _i45.Key? key;

  final _i46.RoomModel room;

  @override
  String toString() {
    return 'AdminChatRoomRouteArgs{key: $key, room: $room}';
  }
}

/// generated route for
/// [_i7.AdminChatRoomsScreen]
class AdminChatRoomsRoute extends _i44.PageRouteInfo<void> {
  const AdminChatRoomsRoute({List<_i44.PageRouteInfo>? children})
      : super(
          AdminChatRoomsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminChatRoomsRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminHomeScreen]
class AdminHomeRoute extends _i44.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i44.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AdminMissionMapScreen]
class AdminMissionMapRoute
    extends _i44.PageRouteInfo<AdminMissionMapRouteArgs> {
  AdminMissionMapRoute({
    _i45.Key? key,
    required _i47.PlanModel plan,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          AdminMissionMapRoute.name,
          args: AdminMissionMapRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminMissionMapRoute';

  static const _i44.PageInfo<AdminMissionMapRouteArgs> page =
      _i44.PageInfo<AdminMissionMapRouteArgs>(name);
}

class AdminMissionMapRouteArgs {
  const AdminMissionMapRouteArgs({
    this.key,
    required this.plan,
  });

  final _i45.Key? key;

  final _i47.PlanModel plan;

  @override
  String toString() {
    return 'AdminMissionMapRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [_i10.CategoryScreen]
class CategoryRoute extends _i44.PageRouteInfo<void> {
  const CategoryRoute({List<_i44.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ChangePasswordScreen]
class ChangePasswordRoute extends _i44.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i44.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ChangePreferencesScreen]
class ChangePreferencesRoute extends _i44.PageRouteInfo<void> {
  const ChangePreferencesRoute({List<_i44.PageRouteInfo>? children})
      : super(
          ChangePreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePreferencesRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CitiesScreen]
class CitiesRoute extends _i44.PageRouteInfo<void> {
  const CitiesRoute({List<_i44.PageRouteInfo>? children})
      : super(
          CitiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitiesRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CitizenAppFrame]
class CitizenAppFrame extends _i44.PageRouteInfo<void> {
  const CitizenAppFrame({List<_i44.PageRouteInfo>? children})
      : super(
          CitizenAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'CitizenAppFrame';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CitizenCalendarScreen]
class CitizenCalendarRoute extends _i44.PageRouteInfo<void> {
  const CitizenCalendarRoute({List<_i44.PageRouteInfo>? children})
      : super(
          CitizenCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenCalendarRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i16.CitizenHomeScreen]
class CitizenHomeRoute extends _i44.PageRouteInfo<void> {
  const CitizenHomeRoute({List<_i44.PageRouteInfo>? children})
      : super(
          CitizenHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenHomeRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i17.CitizenProblemScreen]
class CitizenProblemRoute extends _i44.PageRouteInfo<void> {
  const CitizenProblemRoute({List<_i44.PageRouteInfo>? children})
      : super(
          CitizenProblemRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenProblemRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i18.CitizenProfileScreen]
class CitizenProfileRoute extends _i44.PageRouteInfo<void> {
  const CitizenProfileRoute({List<_i44.PageRouteInfo>? children})
      : super(
          CitizenProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenProfileRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i19.CityLocationsScreen]
class CityLocationsRoute extends _i44.PageRouteInfo<CityLocationsRouteArgs> {
  CityLocationsRoute({
    _i45.Key? key,
    required _i48.CityModel city,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          CityLocationsRoute.name,
          args: CityLocationsRouteArgs(
            key: key,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'CityLocationsRoute';

  static const _i44.PageInfo<CityLocationsRouteArgs> page =
      _i44.PageInfo<CityLocationsRouteArgs>(name);
}

class CityLocationsRouteArgs {
  const CityLocationsRouteArgs({
    this.key,
    required this.city,
  });

  final _i45.Key? key;

  final _i48.CityModel city;

  @override
  String toString() {
    return 'CityLocationsRouteArgs{key: $key, city: $city}';
  }
}

/// generated route for
/// [_i20.DriverAppFrame]
class DriverAppFrame extends _i44.PageRouteInfo<void> {
  const DriverAppFrame({List<_i44.PageRouteInfo>? children})
      : super(
          DriverAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'DriverAppFrame';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i21.DriverChatRoomScreen]
class DriverChatRoomRoute extends _i44.PageRouteInfo<void> {
  const DriverChatRoomRoute({List<_i44.PageRouteInfo>? children})
      : super(
          DriverChatRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriverChatRoomRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i22.DriverIncidentScreen]
class DriverIncidentRoute extends _i44.PageRouteInfo<void> {
  const DriverIncidentRoute({List<_i44.PageRouteInfo>? children})
      : super(
          DriverIncidentRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriverIncidentRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i23.DriverMissionMapScreen]
class DriverMissionMapRoute
    extends _i44.PageRouteInfo<DriverMissionMapRouteArgs> {
  DriverMissionMapRoute({
    _i45.Key? key,
    required _i47.PlanModel plan,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          DriverMissionMapRoute.name,
          args: DriverMissionMapRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'DriverMissionMapRoute';

  static const _i44.PageInfo<DriverMissionMapRouteArgs> page =
      _i44.PageInfo<DriverMissionMapRouteArgs>(name);
}

class DriverMissionMapRouteArgs {
  const DriverMissionMapRouteArgs({
    this.key,
    required this.plan,
  });

  final _i45.Key? key;

  final _i47.PlanModel plan;

  @override
  String toString() {
    return 'DriverMissionMapRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [_i24.DriverPlanLocationsScreen]
class DriverPlanLocationsRoute
    extends _i44.PageRouteInfo<DriverPlanLocationsRouteArgs> {
  DriverPlanLocationsRoute({
    _i45.Key? key,
    required _i47.PlanModel plan,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          DriverPlanLocationsRoute.name,
          args: DriverPlanLocationsRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'DriverPlanLocationsRoute';

  static const _i44.PageInfo<DriverPlanLocationsRouteArgs> page =
      _i44.PageInfo<DriverPlanLocationsRouteArgs>(name);
}

class DriverPlanLocationsRouteArgs {
  const DriverPlanLocationsRouteArgs({
    this.key,
    required this.plan,
  });

  final _i45.Key? key;

  final _i47.PlanModel plan;

  @override
  String toString() {
    return 'DriverPlanLocationsRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [_i25.DriverPlansScreen]
class DriverPlansRoute extends _i44.PageRouteInfo<void> {
  const DriverPlansRoute({List<_i44.PageRouteInfo>? children})
      : super(
          DriverPlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriverPlansRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i26.DriverProfileScreen]
class DriverProfileRoute extends _i44.PageRouteInfo<void> {
  const DriverProfileRoute({List<_i44.PageRouteInfo>? children})
      : super(
          DriverProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriverProfileRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i27.DriversScreen]
class DriversRoute extends _i44.PageRouteInfo<void> {
  const DriversRoute({List<_i44.PageRouteInfo>? children})
      : super(
          DriversRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriversRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i28.ForgotPasswordCode]
class ForgotPasswordCode extends _i44.PageRouteInfo<ForgotPasswordCodeArgs> {
  ForgotPasswordCode({
    _i45.Key? key,
    required String email,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordCode.name,
          args: ForgotPasswordCodeArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordCode';

  static const _i44.PageInfo<ForgotPasswordCodeArgs> page =
      _i44.PageInfo<ForgotPasswordCodeArgs>(name);
}

class ForgotPasswordCodeArgs {
  const ForgotPasswordCodeArgs({
    this.key,
    required this.email,
  });

  final _i45.Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPasswordCodeArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i29.ForgotPasswordEmail]
class ForgotPasswordEmail extends _i44.PageRouteInfo<void> {
  const ForgotPasswordEmail({List<_i44.PageRouteInfo>? children})
      : super(
          ForgotPasswordEmail.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordEmail';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i30.LoginScreen]
class LoginRoute extends _i44.PageRouteInfo<void> {
  const LoginRoute({List<_i44.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i31.PlanLocationsScreen]
class PlanLocationsRoute extends _i44.PageRouteInfo<PlanLocationsRouteArgs> {
  PlanLocationsRoute({
    _i45.Key? key,
    required _i47.PlanModel plan,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          PlanLocationsRoute.name,
          args: PlanLocationsRouteArgs(
            key: key,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'PlanLocationsRoute';

  static const _i44.PageInfo<PlanLocationsRouteArgs> page =
      _i44.PageInfo<PlanLocationsRouteArgs>(name);
}

class PlanLocationsRouteArgs {
  const PlanLocationsRouteArgs({
    this.key,
    required this.plan,
  });

  final _i45.Key? key;

  final _i47.PlanModel plan;

  @override
  String toString() {
    return 'PlanLocationsRouteArgs{key: $key, plan: $plan}';
  }
}

/// generated route for
/// [_i32.PlansScreen]
class PlansRoute extends _i44.PageRouteInfo<void> {
  const PlansRoute({List<_i44.PageRouteInfo>? children})
      : super(
          PlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlansRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i33.ProfileScreen]
class ProfileRoute extends _i44.PageRouteInfo<void> {
  const ProfileRoute({List<_i44.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i34.ReportsScreen]
class ReportsRoute extends _i44.PageRouteInfo<void> {
  const ReportsRoute({List<_i44.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i35.ResetPassword]
class ResetPassword extends _i44.PageRouteInfo<ResetPasswordArgs> {
  ResetPassword({
    _i45.Key? key,
    required String code,
    required String email,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          ResetPassword.name,
          args: ResetPasswordArgs(
            key: key,
            code: code,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPassword';

  static const _i44.PageInfo<ResetPasswordArgs> page =
      _i44.PageInfo<ResetPasswordArgs>(name);
}

class ResetPasswordArgs {
  const ResetPasswordArgs({
    this.key,
    required this.code,
    required this.email,
  });

  final _i45.Key? key;

  final String code;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordArgs{key: $key, code: $code, email: $email}';
  }
}

/// generated route for
/// [_i36.Signup]
class Signup extends _i44.PageRouteInfo<void> {
  const Signup({List<_i44.PageRouteInfo>? children})
      : super(
          Signup.name,
          initialChildren: children,
        );

  static const String name = 'Signup';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i37.TrucksScreen]
class TrucksRoute extends _i44.PageRouteInfo<void> {
  const TrucksRoute({List<_i44.PageRouteInfo>? children})
      : super(
          TrucksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrucksRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i38.UpdateCityScreen]
class UpdateCityRoute extends _i44.PageRouteInfo<UpdateCityRouteArgs> {
  UpdateCityRoute({
    _i45.Key? key,
    required _i48.CityModel city,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          UpdateCityRoute.name,
          args: UpdateCityRouteArgs(
            key: key,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCityRoute';

  static const _i44.PageInfo<UpdateCityRouteArgs> page =
      _i44.PageInfo<UpdateCityRouteArgs>(name);
}

class UpdateCityRouteArgs {
  const UpdateCityRouteArgs({
    this.key,
    required this.city,
  });

  final _i45.Key? key;

  final _i48.CityModel city;

  @override
  String toString() {
    return 'UpdateCityRouteArgs{key: $key, city: $city}';
  }
}

/// generated route for
/// [_i39.UpdateDriverScreen]
class UpdateDriverRoute extends _i44.PageRouteInfo<UpdateDriverRouteArgs> {
  UpdateDriverRoute({
    _i45.Key? key,
    required _i49.DriverModel driver,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          UpdateDriverRoute.name,
          args: UpdateDriverRouteArgs(
            key: key,
            driver: driver,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateDriverRoute';

  static const _i44.PageInfo<UpdateDriverRouteArgs> page =
      _i44.PageInfo<UpdateDriverRouteArgs>(name);
}

class UpdateDriverRouteArgs {
  const UpdateDriverRouteArgs({
    this.key,
    required this.driver,
  });

  final _i45.Key? key;

  final _i49.DriverModel driver;

  @override
  String toString() {
    return 'UpdateDriverRouteArgs{key: $key, driver: $driver}';
  }
}

/// generated route for
/// [_i40.UpdateGeneralInformationScreen]
class UpdateGeneralInformationRoute extends _i44.PageRouteInfo<void> {
  const UpdateGeneralInformationRoute({List<_i44.PageRouteInfo>? children})
      : super(
          UpdateGeneralInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateGeneralInformationRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i41.UpdateLocationScreen]
class UpdateLocationRoute extends _i44.PageRouteInfo<void> {
  const UpdateLocationRoute({List<_i44.PageRouteInfo>? children})
      : super(
          UpdateLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateLocationRoute';

  static const _i44.PageInfo<void> page = _i44.PageInfo<void>(name);
}

/// generated route for
/// [_i42.UpdateTruckScreen]
class UpdateTruckRoute extends _i44.PageRouteInfo<UpdateTruckRouteArgs> {
  UpdateTruckRoute({
    _i45.Key? key,
    required _i50.TruckModel truck,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          UpdateTruckRoute.name,
          args: UpdateTruckRouteArgs(
            key: key,
            truck: truck,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTruckRoute';

  static const _i44.PageInfo<UpdateTruckRouteArgs> page =
      _i44.PageInfo<UpdateTruckRouteArgs>(name);
}

class UpdateTruckRouteArgs {
  const UpdateTruckRouteArgs({
    this.key,
    required this.truck,
  });

  final _i45.Key? key;

  final _i50.TruckModel truck;

  @override
  String toString() {
    return 'UpdateTruckRouteArgs{key: $key, truck: $truck}';
  }
}

/// generated route for
/// [_i43.VerifyCityScreen]
class VerifyCityRoute extends _i44.PageRouteInfo<VerifyCityRouteArgs> {
  VerifyCityRoute({
    _i45.Key? key,
    required _i51.LatLng location,
    required String name,
    required String state,
    required String postalCode,
    List<_i44.PageRouteInfo>? children,
  }) : super(
          VerifyCityRoute.name,
          args: VerifyCityRouteArgs(
            key: key,
            location: location,
            name: name,
            state: state,
            postalCode: postalCode,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyCityRoute';

  static const _i44.PageInfo<VerifyCityRouteArgs> page =
      _i44.PageInfo<VerifyCityRouteArgs>(name);
}

class VerifyCityRouteArgs {
  const VerifyCityRouteArgs({
    this.key,
    required this.location,
    required this.name,
    required this.state,
    required this.postalCode,
  });

  final _i45.Key? key;

  final _i51.LatLng location;

  final String name;

  final String state;

  final String postalCode;

  @override
  String toString() {
    return 'VerifyCityRouteArgs{key: $key, location: $location, name: $name, state: $state, postalCode: $postalCode}';
  }
}
