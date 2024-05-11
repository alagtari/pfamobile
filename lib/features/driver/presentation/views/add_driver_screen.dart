import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';
import 'package:mobile/features/driver/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class AddDriverScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddDriverScreen({super.key});

  @override
  _AddDriverScreenState createState() => _AddDriverScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => DriverBloc(),
        child: this,
      );
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
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

  void _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.first_name;
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = context.l10n. first_name_must_be_at_least_3_characters_long;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.last_name_prompt;
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = context.l10n.last_name_length_error;
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

  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;
  }

  void _onSubmit() {
    _validateFirstName(_firstNameController.text);
    if (!valid) return;
    _validateLastName(_lastNameController.text);
    if (!valid) return;
    _validateEmail(_emailController.text);
    if (!valid) return;
    _validateCin(_cinController.text);
    if (!valid) return;
    _validatePhone(_phoneController.text);
    if (!valid) return;
    final driver = DriverModel(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      cin: _cinController.text,
    );
    context.read<DriverBloc>().add(AddDriverEvent(driver: driver));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<DriverBloc, DriverState>(
          listener: (context, state) {
            if (state is AddDriverSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "Driver added succesfully",
                ),
              );
              context.router.back();
            }
            if (state is AddDriverFailed) {
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
              child: Column(
                children: [
                  ScreenTitle(
                    title: context.l10n.add_driver,
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppFormField(
                          hintText: context.l10n.first_name,
                          controller: _firstNameController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: context.l10n.last_name,
                          controller: _lastNameController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
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
                        AppFormField(
                          hintText: context.l10n.cin,
                          controller: _cinController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: context.l10n.phone_number,
                          controller: _phoneController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
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
                        extraMiniVerticalSpacer,
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AppBotton(
                      bottonText: context.l10n.add_driver,
                      onClick: () {
                        _onSubmit();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
