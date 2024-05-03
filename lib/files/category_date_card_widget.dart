import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class CategoryDateCardWidget extends StatelessWidget {
  const CategoryDateCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(25),
      dashPattern: const [7, 4],
      strokeWidth: 1,
      color: AppColors.greenDarkColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.greenLightColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.calendar_month,
                    color: AppColors.greenDarkColor,
                    size: 30,
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
                  decoration: BoxDecoration(
                    color: AppColors.greenLightColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.access_time,
                    color: AppColors.greenDarkColor,
                    size: 30,
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
                      "10:00-12:00",
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
