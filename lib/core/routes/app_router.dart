import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
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
              page: CitizenProblemRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: CitizenProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            AutoRoute(
              page: UpdateLocationRoute.page,
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
              initial: true,
            ),
            AutoRoute(
              page: CitiesRoute.page,
            ),
            AutoRoute(
              page: CityLocationsRoute.page,
            ),
            AutoRoute(
              page: AddCityRoute.page,
            ),
            AutoRoute(
              page: UpdateCityRoute.page,
            ),
            AutoRoute(
              page: VerifyCityRoute.page,
            ),
            AutoRoute(
              page: TrucksRoute.page,
            ),
            AutoRoute(
              page: AddTruckRoute.page,
            ),
            AutoRoute(
              page: UpdateTruckRoute.page,
            ),
            AutoRoute(
              page: DriversRoute.page,
            ),
            AutoRoute(
              page: AddDriverRoute.page,
            ),
            AutoRoute(
              page: UpdateDriverRoute.page,
            ),
            AutoRoute(
              page: PlansRoute.page,
            ),
            AutoRoute(
              page: PlanLocationsRoute.page,
            ),
            AutoRoute(
              page: AddPlanRoute.page,
            ),
            AutoRoute(
              page: AdminMissionMapRoute.page,
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
            CustomRoute(
              page: ProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        CustomRoute(
          page: DriverAppFrame.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              page: DriverPlansRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              initial: true,
            ),
            CustomRoute(
              page: DriverChatRoomRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: DriverIncidentRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: DriverProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        AutoRoute(
          page: DriverMissionMapRoute.page,
        ),
        AutoRoute(
          page: UpdateGeneralInformationRoute.page,
        ),
        AutoRoute(
          page: ChangePasswordRoute.page,
        ),
        AutoRoute(
          page: ChangePreferencesRoute.page,
        ),
      ];
}
