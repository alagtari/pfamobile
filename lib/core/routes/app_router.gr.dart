// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:mobile/features/auth/login/presentation/views/forgot_password_code.dart'
    as _i15;
import 'package:mobile/features/auth/login/presentation/views/forgot_password_email.dart'
    as _i16;
import 'package:mobile/features/auth/login/presentation/views/login_screen.dart'
    as _i17;
import 'package:mobile/features/auth/login/presentation/views/reset_password.dart'
    as _i20;
import 'package:mobile/files/admin_app_frame.dart' as _i1;
import 'package:mobile/files/admin_chat_room_screen.dart' as _i2;
import 'package:mobile/files/admin_chat_rooms_screen.dart' as _i3;
import 'package:mobile/files/admin_home_screen.dart' as _i4;
import 'package:mobile/files/category_screen.dart' as _i5;
import 'package:mobile/files/change_password_screen.dart' as _i6;
import 'package:mobile/files/change_prefrences_screen.dart' as _i7;
import 'package:mobile/files/cities_screen.dart' as _i8;
import 'package:mobile/files/citizen_app_frame.dart' as _i9;
import 'package:mobile/files/citizen_calendar_screen.dart' as _i10;
import 'package:mobile/files/citizen_home_screen.dart' as _i11;
import 'package:mobile/files/citizen_profile_screen.dart' as _i12;
import 'package:mobile/files/citizen_report_screen.dart' as _i13;
import 'package:mobile/files/drivers_screen.dart' as _i14;
import 'package:mobile/files/plans_screen.dart' as _i18;
import 'package:mobile/files/reports_screen.dart' as _i19;
import 'package:mobile/files/signup.dart' as _i21;
import 'package:mobile/files/trucks_screen.dart' as _i22;
import 'package:mobile/files/update_address_screen.dart' as _i24;
import 'package:mobile/files/update_general_information_screen.dart' as _i23;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AdminAppFrame.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminAppFrame(),
      );
    },
    AdminChatRoomRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AdminChatRoomScreen(),
      );
    },
    AdminChatRoomsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AdminChatRoomsScreen(),
      );
    },
    AdminHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminHomeScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CategoryScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChangePasswordScreen(),
      );
    },
    ChangePreferencesRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ChangePreferencesScreen(),
      );
    },
    CitiesRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CitiesScreen(),
      );
    },
    CitizenAppFrame.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CitizenAppFrame(),
      );
    },
    CitizenCalendarRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CitizenCalendarScreen(),
      );
    },
    CitizenHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CitizenHomeScreen(),
      );
    },
    CitizenProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CitizenProfileScreen(),
      );
    },
    CitizenReportRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.CitizenReportScreen(),
      );
    },
    DriversRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.DriversScreen(),
      );
    },
    ForgotPasswordCode.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordCodeArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i15.ForgotPasswordCode(
          key: args.key,
          email: args.email,
        )),
      );
    },
    ForgotPasswordEmail.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i16.ForgotPasswordEmail()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i17.LoginScreen()),
      );
    },
    PlansRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PlansScreen(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ReportsScreen(),
      );
    },
    ResetPassword.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(
            child: _i20.ResetPassword(
          key: args.key,
          code: args.code,
          email: args.email,
        )),
      );
    },
    Signup.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.Signup(),
      );
    },
    TrucksRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.TrucksScreen(),
      );
    },
    UpdateGeneralInformationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.UpdateGeneralInformationScreen(),
      );
    },
    UpdateLocationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.UpdateLocationScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminAppFrame]
class AdminAppFrame extends _i25.PageRouteInfo<void> {
  const AdminAppFrame({List<_i25.PageRouteInfo>? children})
      : super(
          AdminAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'AdminAppFrame';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminChatRoomScreen]
class AdminChatRoomRoute extends _i25.PageRouteInfo<void> {
  const AdminChatRoomRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminChatRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminChatRoomRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AdminChatRoomsScreen]
class AdminChatRoomsRoute extends _i25.PageRouteInfo<void> {
  const AdminChatRoomsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminChatRoomsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminChatRoomsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AdminHomeScreen]
class AdminHomeRoute extends _i25.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CategoryScreen]
class CategoryRoute extends _i25.PageRouteInfo<void> {
  const CategoryRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChangePasswordScreen]
class ChangePasswordRoute extends _i25.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ChangePreferencesScreen]
class ChangePreferencesRoute extends _i25.PageRouteInfo<void> {
  const ChangePreferencesRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ChangePreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePreferencesRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CitiesScreen]
class CitiesRoute extends _i25.PageRouteInfo<void> {
  const CitiesRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CitiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitiesRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CitizenAppFrame]
class CitizenAppFrame extends _i25.PageRouteInfo<void> {
  const CitizenAppFrame({List<_i25.PageRouteInfo>? children})
      : super(
          CitizenAppFrame.name,
          initialChildren: children,
        );

  static const String name = 'CitizenAppFrame';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CitizenCalendarScreen]
class CitizenCalendarRoute extends _i25.PageRouteInfo<void> {
  const CitizenCalendarRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CitizenCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenCalendarRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CitizenHomeScreen]
class CitizenHomeRoute extends _i25.PageRouteInfo<void> {
  const CitizenHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CitizenHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CitizenProfileScreen]
class CitizenProfileRoute extends _i25.PageRouteInfo<void> {
  const CitizenProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CitizenProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CitizenReportScreen]
class CitizenReportRoute extends _i25.PageRouteInfo<void> {
  const CitizenReportRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CitizenReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'CitizenReportRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.DriversScreen]
class DriversRoute extends _i25.PageRouteInfo<void> {
  const DriversRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DriversRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriversRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ForgotPasswordCode]
class ForgotPasswordCode extends _i25.PageRouteInfo<ForgotPasswordCodeArgs> {
  ForgotPasswordCode({
    _i26.Key? key,
    required String email,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordCode.name,
          args: ForgotPasswordCodeArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordCode';

  static const _i25.PageInfo<ForgotPasswordCodeArgs> page =
      _i25.PageInfo<ForgotPasswordCodeArgs>(name);
}

class ForgotPasswordCodeArgs {
  const ForgotPasswordCodeArgs({
    this.key,
    required this.email,
  });

  final _i26.Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPasswordCodeArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i16.ForgotPasswordEmail]
class ForgotPasswordEmail extends _i25.PageRouteInfo<void> {
  const ForgotPasswordEmail({List<_i25.PageRouteInfo>? children})
      : super(
          ForgotPasswordEmail.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordEmail';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PlansScreen]
class PlansRoute extends _i25.PageRouteInfo<void> {
  const PlansRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlansRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ReportsScreen]
class ReportsRoute extends _i25.PageRouteInfo<void> {
  const ReportsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ResetPassword]
class ResetPassword extends _i25.PageRouteInfo<ResetPasswordArgs> {
  ResetPassword({
    _i26.Key? key,
    required String code,
    required String email,
    List<_i25.PageRouteInfo>? children,
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

  static const _i25.PageInfo<ResetPasswordArgs> page =
      _i25.PageInfo<ResetPasswordArgs>(name);
}

class ResetPasswordArgs {
  const ResetPasswordArgs({
    this.key,
    required this.code,
    required this.email,
  });

  final _i26.Key? key;

  final String code;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordArgs{key: $key, code: $code, email: $email}';
  }
}

/// generated route for
/// [_i21.Signup]
class Signup extends _i25.PageRouteInfo<void> {
  const Signup({List<_i25.PageRouteInfo>? children})
      : super(
          Signup.name,
          initialChildren: children,
        );

  static const String name = 'Signup';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.TrucksScreen]
class TrucksRoute extends _i25.PageRouteInfo<void> {
  const TrucksRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TrucksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrucksRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i23.UpdateGeneralInformationScreen]
class UpdateGeneralInformationRoute extends _i25.PageRouteInfo<void> {
  const UpdateGeneralInformationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UpdateGeneralInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateGeneralInformationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.UpdateLocationScreen]
class UpdateLocationRoute extends _i25.PageRouteInfo<void> {
  const UpdateLocationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UpdateLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateLocationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
