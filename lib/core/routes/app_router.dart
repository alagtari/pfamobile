import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(page: Signup.page),
        AutoRoute(page: ForgotPasswordEmail.page),
        AutoRoute(page: ForgotPasswordCode.page),
        AutoRoute(page: ResetPassword.page),
        CustomRoute(
          page: CitizenAppFrame.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              page: CitizenHomeRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              initial: true,
            ),
            CustomRoute(
              page: CitizenCalendarRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: CitizenReportRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: CitizenProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            AutoRoute(
              page: UpdateGeneralInformationRoute.page,
            ),
            AutoRoute(
              page: UpdateLocationRoute.page,
            ),
            AutoRoute(
              page: ChangePasswordRoute.page,
            ),
            AutoRoute(
              page: ChangePreferencesRoute.page,
            ),
            AutoRoute(
              page: CategoryRoute.page,
            ),
          ],
        ),
        CustomRoute(
          page: AdminAppFrame.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              page: AdminHomeRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            AutoRoute(
              page: CitiesRoute.page,
            ),
            AutoRoute(
              page: TrucksRoute.page,
            ),
            AutoRoute(
              page: DriversRoute.page,
            ),
            AutoRoute(
              page: PlansRoute.page,
            ),
            CustomRoute(
              page: ReportsRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: AdminChatRoomsRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            AutoRoute(
              page: AdminChatRoomRoute.page,
            ),
          ],
        ),
      ];
}
