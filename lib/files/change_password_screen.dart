import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    super.key,
  });

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  late ValueNotifier<bool> obscured;
  late ValueNotifier<bool> confirmObscured;

  @override
  void initState() {
    super.initState();
    obscured = ValueNotifier(true);
    confirmObscured = ValueNotifier(true);
  }

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
              title: "Change Password",
            ),
            largeVerticalSpacer,
            ValueListenableBuilder<bool>(
              valueListenable: obscured,
              builder: (_, obs, __) => AppFormField(
                obscured: obs,
                hintText: "Old Password",
                controller: _oldPasswordController,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.greyDarkColor,
                  size: 20,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    obscured.value = !obs;
                  },
                  child: obs
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.greyDarkColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: AppColors.greyDarkColor,
                        ),
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            ValueListenableBuilder<bool>(
              valueListenable: obscured,
              builder: (_, obs, __) => AppFormField(
                obscured: obs,
                hintText: "New Password",
                controller: _newPasswordController,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.greyDarkColor,
                  size: 20,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    obscured.value = !obs;
                  },
                  child: obs
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.greyDarkColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: AppColors.greyDarkColor,
                        ),
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            
            ValueListenableBuilder<bool>(
              valueListenable: confirmObscured,
              builder: (_, obs, __) => AppFormField(
                obscured: obs,
                hintText: "Confirm New Password",
                controller: _confirmNewPasswordController,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.greyDarkColor,
                  size: 20,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    confirmObscured.value = !obs;
                  },
                  child: obs
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.greyDarkColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: AppColors.greyDarkColor,
                        ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            AppBotton(
              bottonText: "Change",
              onClick: () {},
            ),
            miniVerticalSpacer,
          ],
        ),
      ),
    );
  }
}
