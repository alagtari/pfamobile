import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/common_widgets/auth_bottom_text.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/auth/data/models/reset_password_request_model.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ResetPassword extends StatefulWidget implements AutoRouteWrapper {
  const ResetPassword({super.key, required this.code, required this.email});
  final String code;
  final String email;

  @override
  _ResetPasswordState createState() => _ResetPasswordState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => AuthBloc(),
        child: this,
      );
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late ValueNotifier<bool> obscured;
  late ValueNotifier<bool> confirmObscured;
  late ValueNotifier<String> errorMessage;
  late bool valid;
  @override
  void initState() {
    super.initState();
    obscured = ValueNotifier(true);
    confirmObscured = ValueNotifier(true);
    errorMessage = ValueNotifier("");
    valid = true;
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
        errorMessage.value = 'Please enter your password confirmation.';
        valid = false;
      });
    } else if (_confirmPasswordController.text != _passwordController.text) {
      setState(() {
        errorMessage.value = 'Password confirmation do not match.';
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _onSubmit() {
    _validatePasswords();

    if (valid) {
      final request = ResetPasswordRequestModel(
        email: widget.email,
        code: widget.code,
        password: _passwordController.text,
      );
      context.read<AuthBloc>().add(ResetPasswordEvent(request: request));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              context.router.replace(
                const LoginRoute(),
              );
            }
            if (state is ResetPasswordFailed) {
              setState(() {
                errorMessage.value = state.message;
              });
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ScreenTitle(
                  title: context.l10n.reset_password,
                  arrowBack: false,
                ),
                extraExtraLargeVerticalSpacer,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.l10n.new_password_prompt,
                    style: TextStyles.extraExtraLargeTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                smallVerticalSpacer,
                ValueListenableBuilder<bool>(
                  valueListenable: obscured,
                  builder: (_, obs, __) => AppFormField(
                    obscured: obs,
                    hintText: context.l10n.new_password,
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
                    hintText: context.l10n.confirm_new_password,
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
                extraMiniVerticalSpacer,
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
                  bottonText: context.l10n.reset,
                  onClick: _onSubmit,
                ),
                miniVerticalSpacer,
                const AuthBottomText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
