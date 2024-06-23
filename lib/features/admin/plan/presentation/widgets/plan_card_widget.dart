import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/enums/mission_enum.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/features/admin/plan/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class PlanCardWidget extends StatefulWidget implements AutoRouteWrapper {
  const PlanCardWidget({
    required this.plan,
    super.key,
  });

  final PlanModel plan;
  @override
  State<PlanCardWidget> createState() => _PlanCardWidgetState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => PlanBloc(),
        child: this,
      );
}

class _PlanCardWidgetState extends State<PlanCardWidget> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(25),
      dashPattern: const [7, 4],
      strokeWidth: 1,
      color: AppColors.greyDarkColor,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              log(widget.plan.status.toString());

              if (widget.plan.status == MissionStatus.in_progress) {
                context.router.push(AdminMissionMapRoute(plan: widget.plan));
              } else {
                context.router.push(PlanLocationsRoute(plan: widget.plan));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyLightColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  largeVerticalSpacer,
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: AppColors.greyLessDarkColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: AppColors.greyDarkColor,
                          size: 26,
                        ),
                      ),
                      extraMiniHorizantalSpacer,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.day,
                            style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.greyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DateFormat('dd MMM yyyy')
                                .format(widget.plan.date.toLocal()),
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  extraSmallVerticalSpacer,
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: AppColors.greyLessDarkColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.access_time,
                          color: AppColors.greyDarkColor,
                          size: 26,
                        ),
                      ),
                      extraMiniHorizantalSpacer,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.time,
                            style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.greyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${DateFormat.Hm().format(widget.plan.startHour.toLocal())} - ${DateFormat.Hm().format(widget.plan.endHour.toLocal())}",
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  extraSmallVerticalSpacer,
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.greyLessDarkColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgPicture.asset(
                          "assets/svg/trash_icon.svg",
                          colorFilter: const ColorFilter.mode(
                            AppColors.greyDarkColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      extraMiniHorizantalSpacer,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.garbage,
                            style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.greyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.plan.garbageType,
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: PopupMenuButton<String>(
              position: PopupMenuPosition.under,
              offset: Offset.fromDirection(10),
              color: AppColors.whiteDarkColor,
              surfaceTintColor: AppColors.whiteDarkColor,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: '1',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit_note,
                        color: AppColors.blackDarkColor,
                      ),
                      extraMiniHorizantalSpacer,
                      Text(
                        context.l10n.update,
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackDarkColor,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '2',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: AppColors.blackDarkColor,
                      ),
                      extraMiniHorizantalSpacer,
                      Text(
                        context.l10n.delete,
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackDarkColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                log(value);
                switch (value) {
                  case "1":
                    context.router.push(UpdatePlanRoute(plan: widget.plan));
                  case "2":
                    context.read<PlanBloc>().add(
                          DeletePlanEvent(id: widget.plan.id!),
                        );
                }
              },
              child: Container(
                width: 32,
                height: 17,
                decoration: BoxDecoration(
                  color: AppColors.greyLessDarkColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/more_icon.svg",
                    width: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.greyDarkColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 15,
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.blackDarkColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  widget.plan.truck.number,
                  style: TextStyles.extraSmallTextStyle.copyWith(
                      color: AppColors.whiteDarkColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
