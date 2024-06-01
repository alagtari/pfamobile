import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/chat/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/driver/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/driver/presentation/widgets/driver_card_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:visibility_detector/visibility_detector.dart';

@RoutePage()
class DriversScreen extends StatefulWidget implements AutoRouteWrapper {
  const DriversScreen({super.key});

  @override
  State<DriversScreen> createState() => _DriversScreenState();
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => DriverBloc(),
        child: this,
      );
}

class _DriversScreenState extends State<DriversScreen> {
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('Drivers'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1.0) {
          context.read<DriverBloc>().add(GetDriversEvent());
        }
      },
      child: BlocListener<DriverBloc, DriverState>(
        listener: (context, state) {
          if (state is DeleteDriverSuccess) {
            context.read<DriverBloc>().add(
                  GetDriversEvent(),
                );
          }
        },
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.whiteDarkColor,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .075),
            child: Column(
              children: [
                ScreenTitle(
                  title: context.l10n.drivers,
                ),
                largeVerticalSpacer,
                Expanded(
                  child: BlocBuilder<DriverBloc, DriverState>(
                    builder: (context, state) {
                      if (state is GetDriversSuccess) {
                        final drivers = state.drivers;
                        return ListView.builder(
                          itemCount: drivers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DriverCardWidget(
                              driver: drivers[index],
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: AppBotton(
                    bottonText: context.l10n.add_driver,
                    onClick: () => context.router.push(const AddDriverRoute()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
