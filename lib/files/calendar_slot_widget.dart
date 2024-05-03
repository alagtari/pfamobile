import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class CalendarSlotWidget extends StatelessWidget {
  const CalendarSlotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.greenLightColor,
              borderRadius: BorderRadius.circular(15)),
          height: 50,
          width: 50,
          child: const Center(
            child: Icon(
              Icons.delete,
              color: AppColors.greenDarkColor,
              size: 35,
            ),
          ),
        ),
        extraSmallHorizantalSpacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "10:00-12:00",
              style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.greyDarkColor),
            ),
            Text(
              "Plastic",
              style: TextStyles.largeTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ],
    );
  }
}
