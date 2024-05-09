import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/truck/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/features/truck/presentation/widgets/truck_card_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

@RoutePage()
class TrucksScreen extends StatefulWidget implements AutoRouteWrapper {
  const TrucksScreen({super.key});

  @override
  State<TrucksScreen> createState() => _TrucksScreenState();
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => TruckBloc(),
        child: this,
      );
}

class _TrucksScreenState extends State<TrucksScreen> {
  final List<String> items = List.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("truck"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1.0) {
          context.read<TruckBloc>().add(GetTrucksEvent());
        }
      },
      child: BlocListener<TruckBloc, TruckState>(
        listener: (context, state) {
          if (state is DeleteTruckSuccess) {
            context.read<TruckBloc>().add(
                  GetTrucksEvent(),
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
                const ScreenTitle(
                  title: "Trucks",
                ),
                largeVerticalSpacer,
                Expanded(
                  child: BlocBuilder<TruckBloc, TruckState>(
                    builder: (context, state) {
                      if (state is GetTrucksSuccess) {
                        final trucks = state.trucks;
                        return GridView.builder(
                          primary: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .8,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: trucks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TruckCardWidget(
                              truck: trucks[index],
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
                    bottonText: 'Add Truck',
                    onClick: () => context.router.push(const AddTruckRoute()),
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
