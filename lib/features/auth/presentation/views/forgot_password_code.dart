import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/auth_bottom_text.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/auth/data/models/verify_code_request_model.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:mobile/features/auth/presentation/widgets/validation_code_field.dart';

@RoutePage()
class ForgotPasswordCode extends StatefulWidget implements AutoRouteWrapper {
  const ForgotPasswordCode({super.key, required this.email});
  final String email;

  @override
  _ForgotPasswordCodeState createState() => _ForgotPasswordCodeState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => AuthBloc(),
        child: this,
      );
}

class _ForgotPasswordCodeState extends State<ForgotPasswordCode> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  late ValueNotifier<String> errorMessage;
  late bool valid;
  int _totalSeconds = 5 * 60;
  Timer? _timer;
  String code = "";

  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_totalSeconds > 0) {
        setState(() {
          _totalSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String get formattedTime {
    int minutes = (_totalSeconds / 60).floor();
    int remainingSeconds = _totalSeconds % 60;
    return _totalSeconds > 0
        ? '${minutes > 0 ? '$minutes minutes' : ''} ${remainingSeconds < 10 ? "0" : ""}$remainingSeconds seconds.'
        : '';
  }

  void _validateCode(String value) {
    if (value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter the verification code.';
        valid = false;
      });
    } else if (value.length != 6) {
      setState(() {
        errorMessage.value = 'Code must be 6 digits long.';
        valid = false;
      });
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      setState(() {
        errorMessage.value = 'Code must contain only numbers.';
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
    String verificationCode = "";
    for (var controller in controllers) {
      verificationCode += controller.text;
    }
    setState(() {
      code = verificationCode;
    });
    _validateCode(verificationCode);
    if (valid) {
      final VerifyCodeRequestModel request = VerifyCodeRequestModel(
        email: widget.email,
        code: verificationCode,
      );
      context.read<AuthBloc>().add(
            ForgotPasswordCodeEvent(request: request),
          );
    }
  }

  void _resend() {
    context.read<AuthBloc>().add(
          ResendCodeEvent(
            email: widget.email,
          ),
        );
    setState(() {
      _totalSeconds = 5 * 60;
    });
    _timer?.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ForgotPasswordCodeSuccess) {
              context.router.replace(
                ResetPassword(code: code, email: widget.email),
              );
            }
            if (state is ForgotPasswordCodeFailed) {
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
                const ScreenTitle(
                  title: "Forgot password",
                  arrowBack: false,
                ),
                extraExtraLargeVerticalSpacer,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your Verification code",
                    style: TextStyles.extraExtraLargeTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                extraMiniVerticalSpacer,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter the code sent to your email to proceed.",
                    style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyDarkColor),
                  ),
                ),
                smallVerticalSpacer,
                ValidationCodeField(controllers: controllers),
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
                smallVerticalSpacer,
                _totalSeconds > 0
                    ? Text(
                        "The code is valid for the remaining time of",
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyDarkColor,
                        ),
                      )
                    : Text(
                        "",
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                Text(
                  formattedTime,
                  style: TextStyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDarkColor,
                  ),
                ),
                smallVerticalSpacer,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _resend(),
                    child: Text(
                      "Rensend code",
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenDarkColor,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                AppBotton(
                  bottonText: "Verify Code",
                  onClick: () => _onSubmit(),
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
