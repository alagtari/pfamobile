import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

class NotActiveCategoryWidget extends StatelessWidget {
  const NotActiveCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.greenLightColor,
      ),
      child: Center(
        child: Text(
          "Plastic",
          style: TextStyles.extraSmallTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greenDarkColor,
          ),
        ),
      ),
    );
  }
}
