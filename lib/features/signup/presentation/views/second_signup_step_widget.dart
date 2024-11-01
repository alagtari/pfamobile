import 'package:flutter/material.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class SecondSignupStepWidget extends StatefulWidget {
  const SecondSignupStepWidget({
    super.key,
    required this.submit,
  });

  final Function(
    String phone,
    String cin,
    String password,
    String email,
  ) submit;
  @override
  State<SecondSignupStepWidget> createState() => _SecondSignupStepWidgetState();
}

class _SecondSignupStepWidgetState extends State<SecondSignupStepWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late ValueNotifier<bool> obscured;
  late ValueNotifier<bool> confirmObscured;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cinController = TextEditingController();

  late ValueNotifier<String> errorMessage;
  late bool valid;

  void _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.email_prompt;
        valid = false;
      });
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      setState(() {
        errorMessage.value = context.l10n.valid_email_error;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateCin(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.cin_prompt;
        valid = false;
      });
    } else if (value.length != 8) {
      setState(() {
        errorMessage.value = context.l10n.cin_length_error;
        valid = false;
      });
    } else if (value[0] != '0' && value[0] != '1') {
      setState(() {
        errorMessage.value = context.l10n.cin_format_error;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.phone_number_prompt;
        valid = false;
      });
    } else if (value.length != 8) {
      setState(() {
        errorMessage.value = context.l10n.phone_number_length_error;
        valid = false;
      });
    } else if (!['2', '3', '4', '5', '7', '9'].contains(value[0])) {
      setState(() {
        errorMessage.value = context.l10n.non_tunisian_number_error;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validatePasswords() {
    if (_passwordController.text.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.password_prompt;
        valid = false;
      });
    } else if (_passwordController.text.length < 6) {
      setState(() {
        errorMessage.value = context.l10n.password_length_error;
        valid = false;
      });
    } else if (_confirmPasswordController.text.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.password_prompt;
        valid = false;
      });
    } else if (_confirmPasswordController.text != _passwordController.text) {
      setState(() {
        errorMessage.value = context.l10n.password_confirmation_mismatch;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    obscured = ValueNotifier(true);
    confirmObscured = ValueNotifier(true);
    errorMessage = ValueNotifier("");
    valid = true;
  }

  void _onSubmit() {
    _validatePhone(_phoneController.text);
    if (!valid) return;
    _validateCin(_cinController.text);
    if (!valid) return;
    _validateEmail(_emailController.text);
    if (!valid) return;

    _validatePasswords();
    if (!valid) return;

    widget.submit(
      _phoneController.text,
      _cinController.text,
      _passwordController.text,
      _emailController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          extraMiniVerticalSpacer,
          AppFormField(
            hintText: context.l10n.phone_number,
            controller: _phoneController,
            prefixIcon: const Icon(
              Icons.local_phone_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "Identity Number",
            controller: _cinController,
            prefixIcon: const Icon(
              Icons.perm_identity,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: context.l10n.email,
            controller: _emailController,
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
              hintText: context.l10n.password,
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
              hintText: context.l10n.confirm_password,
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
          extraSmallVerticalSpacer,
          Align(
            alignment: Alignment.centerLeft,
            child: ValueListenableBuilder(
              valueListenable: errorMessage,
              builder: (context, value, child) {
                return Text(
                  errorMessage.value,
                  style: TextStyles.extraSmallTextStyle.copyWith(
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          AppBotton(
            bottonText: context.l10n.continue_step,
            onClick: _onSubmit,
          ),
        ],
      ),
    );
  }
}
