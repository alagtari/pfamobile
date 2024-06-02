import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/setting_option_widget.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
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
            ScreenTitle(
              title: context.l10n.profile,
              arrowBack: false,
            ),
            largeVerticalSpacer,
            SizedBox(
              width: double.infinity,
              child: Text(
                context.l10n.account_settings,
                style: TextStyles.mediumTextStyle.copyWith(
                  color: AppColors.greyDarkColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            largeVerticalSpacer,
            SettingOptionWidget(
              route: UpdateGeneralInformationRoute(),
              icon: "assets/svg/profile_icon.svg",
              settingTitle: context.l10n.general_info,
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
            SettingOptionWidget(
              route: ChangePasswordRoute(),
              icon: "assets/svg/lock.svg",
              settingTitle: context.l10n.change_password,
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
            SettingOptionWidget(
              route: ChangePreferencesRoute(),
              icon: "assets/svg/preferences.svg",
              settingTitle: context.l10n.preferences,
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
            SettingOptionWidget(
                icon: "assets/svg/logout.svg",
                settingTitle: "Logout",
                arrow: false,
                onTap: () async {
                  context.router.replaceAll([const LoginRoute()]);
                  await sl<AppPrefs>().clearAll();
                }),
          ],
        ),
      ),
    );
  }
}
