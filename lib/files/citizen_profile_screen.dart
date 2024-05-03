import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_textarea.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/files/setting_option_widget.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class CitizenProfileScreen extends StatelessWidget {
  const CitizenProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteDarkColor,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .075),
        child: Column(
          children: [
            const ScreenTitle(
              title: "Profile",
              arrowBack: false,
            ),
            largeVerticalSpacer,
            SizedBox(
              width: double.infinity,
              child: Text(
                "Account Settings",
                style: TextStyles.mediumTextStyle.copyWith(
                  color: AppColors.greyDarkColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            largeVerticalSpacer,
            const SettingOptionWidget(
              route: UpdateGeneralInformationRoute(),
              icon: "assets/svg/profile_icon.svg",
              settingTitle: "General Informations",
            ),
            miniVerticalSpacer,
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.greyDarkColor,
                    width: .3,
                  ),
                ),
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
            miniVerticalSpacer,
            const SettingOptionWidget(
                route: UpdateLocationRoute(),
                icon: "assets/svg/location.svg",
                settingTitle: "Addess",
                size: 16),
            miniVerticalSpacer,
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.greyDarkColor,
                    width: .3,
                  ),
                ),
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
            miniVerticalSpacer,
            const SettingOptionWidget(
              route: ChangePasswordRoute(),
              icon: "assets/svg/lock.svg",
              settingTitle: "Change Password",
            ),
            miniVerticalSpacer,
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.greyDarkColor,
                    width: .3,
                  ),
                ),
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
            miniVerticalSpacer,
            const SettingOptionWidget(
              route: ChangePreferencesRoute(),
              icon: "assets/svg/preferences.svg",
              settingTitle: "Preferences",
            ),
          ],
        ),
      ),
    );
  }
}
