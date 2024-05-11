import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/auth_bottom_text.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ForgotPasswordEmail extends StatefulWidget implements AutoRouteWrapper {
  const ForgotPasswordEmail({super.key});

  @override
  _ForgotPasswordEmailState createState() => _ForgotPasswordEmailState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => AuthBloc(),
        child: this,
      );
}

class _ForgotPasswordEmailState extends State<ForgotPasswordEmail> {
  final TextEditingController _emailController = TextEditingController();

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

  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;
  }

  void _onSubmit() {
    _validateEmail(_emailController.text);
    if (valid) {
      context.read<AuthBloc>().add(
            ForgotPasswordEmailEvent(
              email: _emailController.text,
            ),
          );
      context.router.replace(
        ForgotPasswordCode(email: _emailController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              ScreenTitle(
                title: context.l10n.forgot_password,
                arrowBack: false,
              ),
              extraExtraLargeVerticalSpacer,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.email_entry,
                  style: TextStyles.extraExtraLargeTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              extraMiniVerticalSpacer,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.email_verification_prompt,
                  style: TextStyles.smallTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDarkColor),
                ),
              ),
              smallVerticalSpacer,
              AppFormField(
                hintText: context.l10n.email,
                controller: _emailController,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: AppColors.greyDarkColor,
                  size: 20,
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
                bottonText: context.l10n.send_code,
                onClick: () => _onSubmit(),
              ),
              miniVerticalSpacer,
              const AuthBottomText()
            ],
          ),
        ),
      ),
    );
  }
}
