import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/enums/role_enum.dart';
import 'package:mobile/features/auth/login/data/models/auth_request_model.dart';
import 'package:mobile/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/auth_bottom_text.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => AuthBloc(),
        child: this,
      );
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ValueNotifier<bool> obscured;
  final _formKey = GlobalKey<FormState>();
  late ValueNotifier<String> errorMessage;
  late bool valid;

  void _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your email address.';
        valid = false;
      });
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      log('Please enter your password.');
      setState(() {
        errorMessage.value = 'Please enter a valid email address.';
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your password.';
        valid = false;
      });
    } else if (value.length < 6) {
      setState(() {
        errorMessage.value = 'Password must be at least 6 characters long.';
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
    errorMessage = ValueNotifier("");
    valid = true;
  }

  void _onSubmit() {
    _validateEmail(_emailController.text);
    _validatePassword(_passwordController.text);
    if (valid) {
      final userModel = AuthRequestModel(
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<AuthBloc>().add(LoginEvent(request: userModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              switch (state.response.role) {
                case UserRole.citizen:
                  context.router.replace(
                    const CitizenAppFrame(),
                  );
                case UserRole.driver:
                case UserRole.admin:
                  context.router.replace(
                    const AdminAppFrame(),
                  );
              }
            }
            if (state is LoginFailed) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyles.extraExtraLargeTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: SvgPicture.asset(
                      'assets/svg/login.svg',
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  AppFormField(
                    hintText: "Email",
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
                  extraMiniVerticalSpacer,
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () =>
                          context.router.replace(const ForgotPasswordEmail()),
                      child: Text(
                        'Forgot password ?',
                        style: TextStyles.smallTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.greenDarkColor),
                      ),
                    ),
                  ),
                  extraExtraLargeVerticalSpacer,
                  AppBotton(
                      bottonText: "Sign In",
                      onClick: () {
                        _onSubmit();
                      }),
                  miniVerticalSpacer,
                  const AuthBottomText(
                    login: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
