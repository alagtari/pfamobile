import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ChangePreferencesScreen extends StatefulWidget {
  const ChangePreferencesScreen({
    super.key,
  });

  @override
  State<ChangePreferencesScreen> createState() =>
      _ChangePreferencesScreenState();
}

class _ChangePreferencesScreenState extends State<ChangePreferencesScreen> {
  bool light = true;
  TextEditingController controller = TextEditingController();

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
              title: "Change Prefrences",
            ),
            largeVerticalSpacer,
            Row(
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
                      "assets/svg/notification.svg",
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greenDarkColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                extraSmallHorizantalSpacer,
                Text(
                  "Push Notifications",
                  style: TextStyles.mediumTextStyle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: light,
                  activeColor: AppColors.greenDarkColor,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
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
            Row(
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
                      "assets/svg/location.svg",
                      width: 18,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greenDarkColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                extraSmallHorizantalSpacer,
                Text(
                  "Location Service",
                  style: TextStyles.mediumTextStyle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: light,
                  activeColor: AppColors.greenDarkColor,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      light = value;
                    });
                  },
                )
              ],
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
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      padding: EdgeInsets.all(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.whiteDarkColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'Choose a language :',
                            style: TextStyles.mediumTextStyle,
                          ),
                          miniVerticalSpacer,
                          AppFormField(
                              hintText: "Language", controller: controller),
                        ],
                      ),
                    );
                  },
                );
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
                    child: const Center(
                      child: Icon(
                        Icons.language_sharp,
                        size: 28,
                        color: AppColors.greenDarkColor,
                      ),
                    ),
                  ),
                  extraSmallHorizantalSpacer,
                  Text(
                    "Language",
                    style: TextStyles.mediumTextStyle
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.greyDarkColor,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
