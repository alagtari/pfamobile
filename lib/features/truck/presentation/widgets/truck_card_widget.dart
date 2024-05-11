import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/truck/data/models/truck_model.dart';
import 'package:mobile/features/truck/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class TruckCardWidget extends StatefulWidget implements AutoRouteWrapper {
  const TruckCardWidget({
    super.key,
    required this.truck,
  });

  final TruckModel truck;

  @override
  State<TruckCardWidget> createState() => _TruckCardWidgetState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => TruckBloc(),
        child: this,
      );
}

class _TruckCardWidgetState extends State<TruckCardWidget> {
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
          Container(
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
                      child: SvgPicture.asset(
                        "assets/svg/profile_icon.svg",
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
                          context.l10n.driver,
                          style: TextStyles.smallTextStyle.copyWith(
                            color: AppColors.greyDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${widget.truck.driver?.firstName ?? "Unavailable"} ${widget.truck.driver?.lastName ?? ""}",
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
                      child: SvgPicture.asset(
                        "assets/svg/truck_icon.svg",
                        colorFilter: const ColorFilter.mode(
                          AppColors.greyDarkColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    extraMiniHorizantalSpacer,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.truck_model,
                            style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.greyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              widget.truck.model,
                              style: TextStyles.smallTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      child: SvgPicture.asset(
                        "assets/svg/weight_icon.svg",
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
                          context.l10n.truck_capacity,
                          style: TextStyles.smallTextStyle.copyWith(
                            color: AppColors.greyDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${widget.truck.capacity} ${context.l10n.kg}",
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
                switch (value) {
                  case "1":
                    context.router.push(UpdateTruckRoute(truck: widget.truck));
                  default:
                    context.read<TruckBloc>().add(
                          DeleteTruckEvent(id: widget.truck.id!),
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
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.blackDarkColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  widget.truck.number,
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
