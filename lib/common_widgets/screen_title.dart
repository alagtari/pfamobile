import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.title,
    this.arrowBack = true,
    this.color = Colors.black,
  });
  final String title;
  final bool arrowBack;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        arrowBack
            ? GestureDetector(
                onTap: () {
                  context.router.back();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.greenLightColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.greenDarkColor,
                    size: 20,
                  ),
                ),
              )
            : extraLargeHorizantalSpacer,
        Expanded(
          child: Center(
            child: Text(
              title,
              style: TextStyles.extraLargeTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ),
        extraLargeHorizantalSpacer
      ],
    );
  }
}
