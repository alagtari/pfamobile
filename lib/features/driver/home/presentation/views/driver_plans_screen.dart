import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/driver/home/presentation/bloc/bloc.dart';
import 'package:mobile/features/driver/home/presentation/widgets/plan_card_widget.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:visibility_detector/visibility_detector.dart';

@RoutePage()
class DriverPlansScreen extends StatefulWidget implements AutoRouteWrapper {
  const DriverPlansScreen({super.key});

  @override
  State<DriverPlansScreen> createState() => _DriverPlansScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => PlanBloc()..add(GetPlansEvent()),
        child: this,
      );
}

class _DriverPlansScreenState extends State<DriverPlansScreen> {
  final List<String> items = List.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("plans"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 1.0) {
          context.read<PlanBloc>().add(GetPlansEvent());
        }
      },
      child: BlocListener<PlanBloc, PlanState>(
        listener: (context, state) {
          if (state is DeletePlanSuccess) {
            context.read<PlanBloc>().add(
                  GetPlansEvent(),
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
                  title: context.l10n.plans,
                  arrowBack: false,
                ),
                largeVerticalSpacer,
                Expanded(
                  child: BlocBuilder<PlanBloc, PlanState>(
                    builder: (context, state) {
                      if (state is GetPlansSuccess) {
                        final plans = state.plans;
                        return ListView.builder(
                          primary: false,
                          itemCount: (plans.length / 2).round(),
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                PlanCardWidget(
                                  plan: plans[index * 2],
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                (index * 2 + 1 == plans.length
                                    ? const SizedBox()
                                    : PlanCardWidget(
                                        plan: plans[index * 2 + 1],
                                      ))
                              ],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
