import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class CityCardWidget extends StatefulWidget implements AutoRouteWrapper {
  const CityCardWidget({
    super.key,
    required this.city,
  });
  final CityModel city;

  @override
  State<CityCardWidget> createState() => _CityCardWidgetState();
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CityBloc(),
        child: this,
      );
}

class _CityCardWidgetState extends State<CityCardWidget> {
  @override
  Widget build(BuildContext context) {
    final locations = widget.city.locations!.length;
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(25),
      dashPattern: const [7, 4],
      strokeWidth: 1,
      color: AppColors.greyDarkColor,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () =>
                context.router.push(CityLocationsRoute(city: widget.city)),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyLightColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          "assets/svg/city_icon.svg",
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
                            context.l10n.city,
                            style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.greyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.city.name,
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
                          "assets/svg/plan_icon.svg",
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
                            context.l10n.postal_code,
                            style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.greyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.city.postalCode,
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
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
                        padding: const EdgeInsets.all(7),
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
                            "$locations ${locations > 1 ? context.l10n.locations : context.l10n.location}",
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
                switch (value) {
                  case "1":
                    context.router.push(UpdateCityRoute(city: widget.city));
                  default:
                    context.read<CityBloc>().add(
                          DeleteCityEvent(id: widget.city.id!),
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
        ],
      ),
    );
  }
}
