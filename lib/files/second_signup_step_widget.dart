import 'package:flutter/material.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class SecondSignupStepWidget extends StatefulWidget {
  const SecondSignupStepWidget({
    super.key,
    required TextEditingController emailController,
    required this.submit,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final VoidCallback submit;
  @override
  State<SecondSignupStepWidget> createState() => _SecondSignupStepWidgetState();
}

class _SecondSignupStepWidgetState extends State<SecondSignupStepWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
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
    return Expanded(
      child: Column(
        children: [
          AppFormField(
            hintText: "Phone Number",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.local_phone_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "Identity Number",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.perm_identity,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "Email",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          ValueListenableBuilder<bool>(
            valueListenable: obscured,
            builder: (_, obs, __) => AppFormField(
              obscured: obs,
              hintText: "Password",
              controller: _passwordController,
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
              hintText: "Confirm Password",
              controller: _confirmPasswordController,
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
          
          const Expanded(
            child: SizedBox(),
          ),
          AppBotton(
            bottonText: "Continue",
            onClick: widget.submit,
          ),
        ],
      ),
    );
  }
}
