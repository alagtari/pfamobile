// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;
import 'package:mobile/features/auth/presentation/views/forgot_password_code.dart'
    as _i18;
import 'package:mobile/features/auth/presentation/views/forgot_password_email.dart'
    as _i19;
import 'package:mobile/features/auth/presentation/views/login_screen.dart'
    as _i20;
import 'package:mobile/features/auth/presentation/views/reset_password.dart'
    as _i24;
import 'package:mobile/features/city/data/models/city_model.dart' as _i34;
import 'package:mobile/features/city/presentation/views/add_city_screen.dart'
    as _i1;
import 'package:mobile/features/city/presentation/views/cities_screen.dart'
    as _i12;
import 'package:mobile/features/city/presentation/views/update_city_screen.dart'
    as _i27;
import 'package:mobile/features/driver/data/models/driver_model.dart' as _i35;
import 'package:mobile/features/driver/presentation/views/add_driver_screen.dart'
    as _i2;
import 'package:mobile/features/driver/presentation/views/drivers_screen.dart'
    as _i17;
import 'package:mobile/features/driver/presentation/views/update_driver_screen.dart'
    as _i28;
import 'package:mobile/features/plan/presentation/views/add_plan_screen.dart'
    as _i3;
import 'package:mobile/features/plan/presentation/views/plans_screen.dart'
    as _i21;
import 'package:mobile/features/profile/presentation/views/change_password_screen.dart'
    as _i10;
import 'package:mobile/features/truck/data/models/truck_model.dart' as _i36;
import 'package:mobile/features/truck/presentation/views/add_truck_screen.dart'
    as _i4;
import 'package:mobile/features/truck/presentation/views/trucks_screen.dart'
    as _i26;
import 'package:mobile/features/truck/presentation/views/update_truck_screen.dart'
    as _i31;
import 'package:mobile/files/admin_app_frame.dart' as _i5;
import 'package:mobile/files/admin_chat_room_screen.dart' as _i6;
import 'package:mobile/files/admin_chat_rooms_screen.dart' as _i7;
import 'package:mobile/files/admin_home_screen.dart' as _i8;
import 'package:mobile/files/category_screen.dart' as _i9;
import 'package:mobile/files/change_prefrences_screen.dart' as _i11;
import 'package:mobile/files/citizen_app_frame.dart' as _i13;
import 'package:mobile/files/citizen_calendar_screen.dart' as _i14;
import 'package:mobile/files/citizen_home_screen.dart' as _i15;
import 'package:mobile/files/citizen_report_screen.dart' as _i16;
import 'package:mobile/features/profile/presentation/views/profile_screen.dart' as _i22;
import 'package:mobile/files/reports_screen.dart' as _i23;
import 'package:mobile/features/signup/presentation/views/signup.dart' as _i25;
import 'package:mobile/files/update_address_screen.dart' as _i30;
import 'package:mobile/features/profile/presentation/views/update_general_information_screen.dart' as _i29;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    AddCityRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i1.AddCityScreen()),
      );
    },
    AddDriverRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i2.AddDriverScreen()),
      );
    },
    AddPlanRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i3.AddPlanScreen()),
      );
    },
    AddTruckRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i4.AddTruckScreen()),
      );
    },
    AdminAppFrame.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AdminAppFrame(),
      );
    },
    AdminChatRoomRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminChatRoomScreen(),
      );
    },
    AdminChatRoomsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AdminChatRoomsScreen(),
      );
    },
    AdminHomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AdminHomeScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CategoryScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i10.ChangePasswordScreen()),
      );
    },
    ChangePreferencesRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ChangePreferencesScreen(),
      );
    },
    CitiesRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i12.CitiesScreen()),
      );
    },
    CitizenAppFrame.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.CitizenAppFrame(),
      );
    },
    CitizenCalendarRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CitizenCalendarScreen(),
      );
    },
    CitizenHomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.CitizenHomeScreen(),
      );
    },
    CitizenReportRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CitizenReportScreen(),
      );
    },
    DriversRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i17.DriversScreen()),
      );
    },
    ForgotPasswordCode.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordCodeArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i18.ForgotPasswordCode(
          key: args.key,
          email: args.email,
        )),
      );
    },
    ForgotPasswordEmail.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i19.ForgotPasswordEmail()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i20.LoginScreen()),
      );
    },
    PlansRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i21.PlansScreen()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ProfileScreen(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.ReportsScreen(),
      );
    },
    ResetPassword.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i24.ResetPassword(
          key: args.key,
          code: args.code,
          email: args.email,
        )),
      );
    },
    Signup.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.Signup(),
      );
    },
    TrucksRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i26.TrucksScreen()),
      );
    },
    UpdateCityRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCityRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i27.UpdateCityScreen(
          key: args.key,
          city: args.city,
        )),
      );
    },
    UpdateDriverRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateDriverRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i28.UpdateDriverScreen(
          key: args.key,
          driver: args.driver,
        )),
      );
    },
    UpdateGeneralInformationRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.UpdateGeneralInformationScreen(),
      );
    },
    UpdateLocationRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.UpdateLocationScreen(),
      );
    },
    UpdateTruckRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTruckRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(
            child: _i31.UpdateTruckScreen(
          key: args.key,
          truck: args.truck,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCityScreen]
class AddCityRoute extends _i32.PageRouteInfo<void> {
  const AddCityRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AddCityRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCityRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddDriverScreen]
class AddDriverRoute extends _i32.PageRouteInfo<void> {
  const AddDriverRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AddDriverRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDriverRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddPlanScreen]
class AddPlanRoute extends _i32.PageRouteInfo<void> {
  const AddPlanRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AddPlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPlanRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AddTruckScreen]
class AddTruckRoute extends _i32.PageRouteInfo<void> {
  const AddTruckRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AddTruckRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTruckRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminAppFrame]
class AdminAppFrame extends _i32.PageRouteInfo<void> {
  const AdminAppFrame({List<_i32.PageRouteInfo>? children})
      : super(
          AdminAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'AdminAppFrame';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AdminChatRoomScreen]
class AdminChatRoomRoute extends _i32.PageRouteInfo<void> {
  const AdminChatRoomRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AdminChatRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminChatRoomRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AdminChatRoomsScreen]
class AdminChatRoomsRoute extends _i32.PageRouteInfo<void> {
  const AdminChatRoomsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AdminChatRoomsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminChatRoomsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminHomeScreen]
class AdminHomeRoute extends _i32.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CategoryScreen]
class CategoryRoute extends _i32.PageRouteInfo<void> {
  const CategoryRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ChangePasswordScreen]
class ChangePasswordRoute extends _i32.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ChangePreferencesScreen]
class ChangePreferencesRoute extends _i32.PageRouteInfo<void> {
  const ChangePreferencesRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ChangePreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePreferencesRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CitiesScreen]
class CitiesRoute extends _i32.PageRouteInfo<void> {
  const CitiesRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CitiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitiesRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CitizenAppFrame]
class CitizenAppFrame extends _i32.PageRouteInfo<void> {
  const CitizenAppFrame({List<_i32.PageRouteInfo>? children})
      : super(
          CitizenAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'CitizenAppFrame';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CitizenCalendarScreen]
class CitizenCalendarRoute extends _i32.PageRouteInfo<void> {
  const CitizenCalendarRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CitizenCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenCalendarRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CitizenHomeScreen]
class CitizenHomeRoute extends _i32.PageRouteInfo<void> {
  const CitizenHomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CitizenHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenHomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i16.CitizenReportScreen]
class CitizenReportRoute extends _i32.PageRouteInfo<void> {
  const CitizenReportRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CitizenReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenReportRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i17.DriversScreen]
class DriversRoute extends _i32.PageRouteInfo<void> {
  const DriversRoute({List<_i32.PageRouteInfo>? children})
      : super(
          DriversRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriversRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ForgotPasswordCode]
class ForgotPasswordCode extends _i32.PageRouteInfo<ForgotPasswordCodeArgs> {
  ForgotPasswordCode({
    _i33.Key? key,
    required String email,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordCode.name,
          args: ForgotPasswordCodeArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordCode';

  static const _i32.PageInfo<ForgotPasswordCodeArgs> page =
      _i32.PageInfo<ForgotPasswordCodeArgs>(name);
}

class ForgotPasswordCodeArgs {
  const ForgotPasswordCodeArgs({
    this.key,
    required this.email,
  });

  final _i33.Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPasswordCodeArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i19.ForgotPasswordEmail]
class ForgotPasswordEmail extends _i32.PageRouteInfo<void> {
  const ForgotPasswordEmail({List<_i32.PageRouteInfo>? children})
      : super(
          ForgotPasswordEmail.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordEmail';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i20.LoginScreen]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute({List<_i32.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PlansScreen]
class PlansRoute extends _i32.PageRouteInfo<void> {
  const PlansRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlansRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ProfileScreen]
class ProfileRoute extends _i32.PageRouteInfo<void> {
  const ProfileRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i23.ReportsScreen]
class ReportsRoute extends _i32.PageRouteInfo<void> {
  const ReportsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ResetPassword]
class ResetPassword extends _i32.PageRouteInfo<ResetPasswordArgs> {
  ResetPassword({
    _i33.Key? key,
    required String code,
    required String email,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<ResetPasswordArgs> page =
      _i32.PageInfo<ResetPasswordArgs>(name);
}

class ResetPasswordArgs {
  const ResetPasswordArgs({
    this.key,
    required this.code,
    required this.email,
  });

  final _i33.Key? key;

  final String code;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordArgs{key: $key, code: $code, email: $email}';
  }
}

/// generated route for
/// [_i25.Signup]
class Signup extends _i32.PageRouteInfo<void> {
  const Signup({List<_i32.PageRouteInfo>? children})
      : super(
          Signup.name,
          initialChildren: children,
        );

  static const String name = 'Signup';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i26.TrucksScreen]
class TrucksRoute extends _i32.PageRouteInfo<void> {
  const TrucksRoute({List<_i32.PageRouteInfo>? children})
      : super(
          TrucksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrucksRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i27.UpdateCityScreen]
class UpdateCityRoute extends _i32.PageRouteInfo<UpdateCityRouteArgs> {
  UpdateCityRoute({
    _i33.Key? key,
    required _i34.CityModel city,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          UpdateCityRoute.name,
          args: UpdateCityRouteArgs(
            key: key,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCityRoute';

  static const _i32.PageInfo<UpdateCityRouteArgs> page =
      _i32.PageInfo<UpdateCityRouteArgs>(name);
}

class UpdateCityRouteArgs {
  const UpdateCityRouteArgs({
    this.key,
    required this.city,
  });

  final _i33.Key? key;

  final _i34.CityModel city;

  @override
  String toString() {
    return 'UpdateCityRouteArgs{key: $key, city: $city}';
  }
}

/// generated route for
/// [_i28.UpdateDriverScreen]
class UpdateDriverRoute extends _i32.PageRouteInfo<UpdateDriverRouteArgs> {
  UpdateDriverRoute({
    _i33.Key? key,
    required _i35.DriverModel driver,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          UpdateDriverRoute.name,
          args: UpdateDriverRouteArgs(
            key: key,
            driver: driver,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateDriverRoute';

  static const _i32.PageInfo<UpdateDriverRouteArgs> page =
      _i32.PageInfo<UpdateDriverRouteArgs>(name);
}

class UpdateDriverRouteArgs {
  const UpdateDriverRouteArgs({
    this.key,
    required this.driver,
  });

  final _i33.Key? key;

  final _i35.DriverModel driver;

  @override
  String toString() {
    return 'UpdateDriverRouteArgs{key: $key, driver: $driver}';
  }
}

/// generated route for
/// [_i29.UpdateGeneralInformationScreen]
class UpdateGeneralInformationRoute extends _i32.PageRouteInfo<void> {
  const UpdateGeneralInformationRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UpdateGeneralInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateGeneralInformationRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i30.UpdateLocationScreen]
class UpdateLocationRoute extends _i32.PageRouteInfo<void> {
  const UpdateLocationRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UpdateLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateLocationRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i31.UpdateTruckScreen]
class UpdateTruckRoute extends _i32.PageRouteInfo<UpdateTruckRouteArgs> {
  UpdateTruckRoute({
    _i33.Key? key,
    required _i36.TruckModel truck,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          UpdateTruckRoute.name,
          args: UpdateTruckRouteArgs(
            key: key,
            truck: truck,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTruckRoute';

  static const _i32.PageInfo<UpdateTruckRouteArgs> page =
      _i32.PageInfo<UpdateTruckRouteArgs>(name);
}

class UpdateTruckRouteArgs {
  const UpdateTruckRouteArgs({
    this.key,
    required this.truck,
  });

  final _i33.Key? key;

  final _i36.TruckModel truck;

  @override
  String toString() {
    return 'UpdateTruckRouteArgs{key: $key, truck: $truck}';
  }
}
