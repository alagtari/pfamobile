import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class SettingOptionWidget extends StatelessWidget {
  const SettingOptionWidget({
    super.key,
    required this.icon,
    required this.settingTitle,
    this.size = 20,
    required this.route,
  });

  final String icon;
  final String settingTitle;
  final double size;
  final route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(route);
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.greenLightColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 35,
            width: 35,
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: size,
                colorFilter: const ColorFilter.mode(
                  AppColors.greenDarkColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          extraSmallHorizantalSpacer,
          Text(
            settingTitle,
            style: TextStyles.mediumTextStyle
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          )
        ],
      ),
    );
  }
}