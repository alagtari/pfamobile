import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({
    super.key,
  });

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
                          "Day",
                          style: TextStyles.smallTextStyle.copyWith(
                            color: AppColors.greyDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "27 Mar 2024",
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
                          "Time",
                          style: TextStyles.smallTextStyle.copyWith(
                            color: AppColors.greyDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "10:00 - 12:00",
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
                          "Garbage",
                          style: TextStyles.smallTextStyle.copyWith(
                            color: AppColors.greyDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Plastic",
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
                  value: 'option1',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit_note,
                        color: AppColors.blackDarkColor,
                      ),
                      extraMiniHorizantalSpacer,
                      Text(
                        "Update",
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackDarkColor,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: AppColors.blackDarkColor,
                      ),
                      extraMiniHorizantalSpacer,
                      Text(
                        "Delete",
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackDarkColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
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
                  '199  TUN  2001',
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
