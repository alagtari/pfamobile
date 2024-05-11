import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/profile/data/models/change_password_model.dart';
import 'package:mobile/features/profile/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ChangePasswordScreen({
    super.key,
  });

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ProfileBloc(),
        child: this,
      );
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  late ValueNotifier<bool> obscured;
  late ValueNotifier<bool> confirmObscured;

  late ValueNotifier<String> errorMessage;
  late bool valid;
  void _validatePasswords() {
    if (_oldPasswordController.text.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.old_password_prompt;
        valid = false;
      });
    } else if (_oldPasswordController.text.length < 6) {
      setState(() {
        errorMessage.value = context.l10n.old_password_length_error;
        valid = false;
      });
    }
    if (_newPasswordController.text.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.new_password_prompt;
        valid = false;
      });
    } else if (_newPasswordController.text.length < 6) {
      setState(() {
        errorMessage.value = context.l10n.new_password_length_error;
        valid = false;
      });
    } else if (_confirmNewPasswordController.text.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.password_confirmation_prompt;
        valid = false;
      });
    } else if (_confirmNewPasswordController.text !=
        _newPasswordController.text) {
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
    _validatePasswords();
    if (valid) {
      final changePasswordModel = ChangePasswordModel(
        oldPassword: _oldPasswordController.text,
        newPassword: _newPasswordController.text,
      );
      context.read<ProfileBloc>().add(
            ChangePasswordEvent(
              request: changePasswordModel,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          context.router.back();
        }
      },
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.whiteDarkColor,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .075),
          child: Column(
            children: [
              ScreenTitle(
                title: context.l10n.change_password,
              ),
              largeVerticalSpacer,
              ValueListenableBuilder<bool>(
                valueListenable: obscured,
                builder: (_, obs, __) => AppFormField(
                  obscured: obs,
                  hintText: context.l10n.old_password,
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
                  hintText: context.l10n.new_password,
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
                  hintText: context.l10n.confirm_new_password,
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
              const Expanded(child: SizedBox()),
              AppBotton(
                bottonText: context.l10n.change,
                onClick: _onSubmit,
              ),
              miniVerticalSpacer,
            ],
          ),
        ),
      ),
    );
  }
}
