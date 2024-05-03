import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/common_widgets/app_stepper.dart';
import 'package:mobile/common_widgets/auth_bottom_text.dart';
import 'package:mobile/files/first_signup_step_widget.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/files/second_signup_step_widget.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:mobile/files/third_signup_step_widget.dart';

@RoutePage()
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();

  late ValueNotifier<int> step;

  @override
  void initState() {
    super.initState();
    step = ValueNotifier(1);
  }

  void nextStep() {
    setState(() {
      step.value += 1;
    });
  }

  void goToStep(int destinationStep) {
    if (destinationStep < step.value) {
      setState(() {
        step.value = destinationStep;
      });
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
              const ScreenTitle(
                title: "Signup",
                arrowBack: false,
              ),
              smallVerticalSpacer,
              ValueListenableBuilder(
                valueListenable: step,
                builder: (context, value, child) {
                  return AppStepper(step: value, goToStep: goToStep);
                },
              ),
              smallVerticalSpacer,
              ValueListenableBuilder(
                valueListenable: step,
                builder: (context, value, child) {
                  if (value == 2) {
                    return SecondSignupStepWidget(
                      emailController: _emailController,
                      submit: nextStep,
                    );
                  }
                  if (value == 3) {
                    return ThirdSignupStepWidget(
                      emailController: _emailController,
                      submit: nextStep,
                    );
                  }

                  return FirstSignupStepWidget(
                    emailController: _emailController,
                    submit: nextStep,
                  );
                },
              ),
              miniVerticalSpacer,
              const AuthBottomText(),
            ],
          ),
        ),
      ),
    );
  }
}
