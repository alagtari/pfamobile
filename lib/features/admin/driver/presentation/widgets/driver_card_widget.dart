import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/admin/driver/data/models/driver_model.dart';
import 'package:mobile/features/admin/driver/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class DriverCardWidget extends StatefulWidget implements AutoRouteWrapper {
  const DriverCardWidget({
    super.key,
    required this.driver,
  });

  final DriverModel driver;

  @override
  State<DriverCardWidget> createState() => _DriverCardWidgetState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => DriverBloc(),
        child: this,
      );
}

class _DriverCardWidgetState extends State<DriverCardWidget> {
  String transformString(String phoneNumber) {
    final pattern = RegExp(r'(\d{2})(\d{3})(\d{3})');
    final match = pattern.firstMatch(phoneNumber);

    if (match != null) {
      return '${match.group(1)} ${match.group(2)} ${match.group(3)}';
    }

    return phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(30),
        dashPattern: const [7, 4],
        strokeWidth: 1,
        color: AppColors.greyDarkColor,
        child: Stack(
          children: [
            Container(
              height: 121,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyLightColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.driver.image != null
                            ? NetworkImage(
                                "${dotenv.env['IMAGE_BASE_URL']}/${widget.driver.image}")
                            : const AssetImage('assets/images/profile.jpg')
                                as ImageProvider,
                      ),
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                  miniHorizantalSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      extraMiniVerticalSpacer,
                      Text(
                        "${widget.driver.firstName} ${widget.driver.lastName}",
                        style: TextStyles.largeTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      extraMiniVerticalSpacer,
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 28,
                      //       width: 28,
                      //       padding: const EdgeInsets.all(5),
                      //       decoration: BoxDecoration(
                      //         color: AppColors.greyLessDarkColor,
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //       child: const Icon(
                      //         Icons.email_outlined,
                      //         color: AppColors.greyDarkColor,
                      //         size: 18,
                      //       ),
                      //     ),
                      //     extraMiniHorizantalSpacer,
                      //     Container(
                      //       child: Text(
                      //         widget.driver.email,
                      //         style: TextStyles.extraSmallTextStyle.copyWith(
                      //           fontWeight: FontWeight.w600,
                      //           color: AppColors.greyDarkColor,
                      //         ),
                      //         overflow: TextOverflow.ellipsis,
                      //         maxLines: 1,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // extraMiniVerticalSpacer,
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.greyLessDarkColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.local_phone,
                              color: AppColors.greyDarkColor,
                              size: 18,
                            ),
                          ),
                          extraMiniHorizantalSpacer,
                          Text(
                            transformString(widget.driver.phone),
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyDarkColor,
                            ),
                          )
                        ],
                      ),
                      miniVerticalSpacer,
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.blackDarkColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            widget.driver.truck?.number ?? "unknown",
                            style: TextStyles.extraSmallTextStyle.copyWith(
                                color: AppColors.whiteDarkColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          style: TextStyles.extraSmallTextStyle.copyWith(
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
                          style: TextStyles.extraSmallTextStyle.copyWith(
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
                      context.router
                          .push(UpdateDriverRoute(driver: widget.driver));
                    default:
                      context.read<DriverBloc>().add(
                            DeleteDriverEvent(id: widget.driver.id!),
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
      ),
    );
  }
}
