import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common_widgets/app_dropdown_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/l10n/bloc/language_bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ChangePreferencesScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const ChangePreferencesScreen({
    super.key,
  });

  @override
  State<ChangePreferencesScreen> createState() =>
      _ChangePreferencesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => LanguageBloc(),
        child: this,
      );
}

class _ChangePreferencesScreenState extends State<ChangePreferencesScreen> {
  bool light = true;
  TextEditingController controller = TextEditingController();

  late ValueNotifier<List<DropdownMenuItem>> _languages;
  @override
  void initState() {
    super.initState();
    _languages = ValueNotifier<List<DropdownMenuItem>>([]);
    // _getLanguages
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languages.value = _getLanguages();
  }

  void _onChanged(String l) {
    context.read<LanguageBloc>().add(
          ChangeLanguage(selectedLanguage: l),
        );
  }

  List<DropdownMenuItem> _getLanguages() {
    return [
      DropdownMenuItem(
        value: "en",
        child: Text(
          context.l10n.en,
          style: const TextStyle(
            color: AppColors.greyDarkColor,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "fr",
        child: Text(
          context.l10n.fr,
          style: const TextStyle(
            color: AppColors.greyDarkColor,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "ar",
        child: Text(
          context.l10n.ar,
          style: const TextStyle(
            color: AppColors.greyDarkColor,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.whiteDarkColor,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .075),
              child: Column(
                children: [
                  ScreenTitle(
                    title: context.l10n.change,
                    arrowBack: true,
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
                        context.l10n.location_service,
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
                              children: [
                                const Text(
                                  'Choose a language :',
                                  style: TextStyles.mediumTextStyle,
                                ),
                                miniVerticalSpacer,
                                AppDropdownWidget(
                                  items: _getLanguages(),
                                  onChange: _onChanged,
                                  hint: context.l10n.garbage_type,
                                  icon: Icons.fire_truck,
                                )
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
                          context.l10n.language,
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
          ),
        );
      },
    );
  }
}
