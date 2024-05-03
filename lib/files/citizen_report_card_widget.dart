import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class CitizenReportCardWidget extends StatelessWidget {
  const CitizenReportCardWidget({
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
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.greyLightColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                extraMiniHorizantalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ala Gtari",
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "02-02-2024",
                      style: TextStyles.extraSmallTextStyle.copyWith(
                        color: AppColors.greyDarkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            ),
            miniVerticalSpacer,
            Container(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                "galley of type and rele scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting typesetting typesetting",
                style: TextStyles.extraSmallTextStyle.copyWith(
                  color: AppColors.greyDarkColor,
                  fontSize: 11
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
