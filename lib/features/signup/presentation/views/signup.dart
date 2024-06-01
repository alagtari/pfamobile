import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_stepper.dart';
import 'package:mobile/common_widgets/auth_bottom_text.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/admin/city/presentation/bloc/bloc.dart';
import 'package:mobile/features/signup/data/models/signup_model.dart';
import 'package:mobile/features/signup/presentation/bloc/bloc.dart';
import 'package:mobile/features/signup/presentation/views/first_signup_step_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/signup/presentation/views/second_signup_step_widget.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/features/signup/presentation/views/third_signup_step_widget.dart';

@RoutePage()
class Signup extends StatefulWidget implements AutoRouteWrapper {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(),
          ),
          BlocProvider(
            create: (context) => CityBloc()..add(GetCitiesEvent()),
          )
        ],
        child: this,
      );
}

class _SignupState extends State<Signup> {
  late ValueNotifier<int> step;
  late String _firstName;
  late String _lastName;
  late DateTime _birthDate;
  late String _gender;
  late String? _image;
  late String _phone;
  late String _cin;
  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
    step = ValueNotifier(1);
  }

  void toSecondStep(
    String firstName,
    String lastName,
    DateTime birthDate,
    String gender,
    String? image,
  ) {
    setState(() {
      _firstName = firstName;
      _lastName = lastName;
      _birthDate = birthDate;
      _gender = gender;
      _image = image;
    });
    nextStep();
  }

  void toThirdStep(
    String phone,
    String cin,
    String password,
    String email,
  ) {
    setState(() {
      _phone = phone;
      _cin = cin;
      _password = password;
      _email = email;
    });
    nextStep();
  }

  void submit(
    String city,
    String street,
  ) {
    final signup = SignupModel(
      firstName: _firstName,
      lastName: _lastName,
      birthDate: _birthDate,
      gender: _gender,
      image: _image,
      phone: _phone,
      cin: _cin,
      email: _email,
      password: _password,
      city: city,
      street: street,
    );
    context.read<SignupBloc>().add(SignupUserEvent(request: signup));
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
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupUserSuccess) {
          context.router.replace(const LoginRoute());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ScreenTitle(
                  title: context.l10n.signup,
                  arrowBack: false,
                ),
                smallVerticalSpacer,
                ValueListenableBuilder(
                  valueListenable: step,
                  builder: (context, value, child) {
                    return AppStepper(step: value);
                  },
                ),
                smallVerticalSpacer,
                ValueListenableBuilder(
                  valueListenable: step,
                  builder: (context, value, child) {
                    if (value == 2) {
                      return SecondSignupStepWidget(
                        submit: toThirdStep,
                      );
                    }
                    if (value == 3) {
                      return ThirdSignupStepWidget(
                        submit: submit,
                      );
                    }

                    return FirstSignupStepWidget(
                      submit: toSecondStep,
                    );
                  },
                ),
                miniVerticalSpacer,
                const AuthBottomText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
