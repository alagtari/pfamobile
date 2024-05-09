import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';
import 'package:mobile/features/driver/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class UpdateDriverScreen extends StatefulWidget implements AutoRouteWrapper {
  const UpdateDriverScreen({
    super.key,
    required this.driver,
  });

  final DriverModel driver;

  @override
  _UpdateDriverScreenState createState() => _UpdateDriverScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => DriverBloc(),
        child: this,
      );
}

class _UpdateDriverScreenState extends State<UpdateDriverScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _cinController;

  late ValueNotifier<String> errorMessage;
  late bool valid;
  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;
    _firstNameController = TextEditingController(text: widget.driver.firstName);
    _lastNameController = TextEditingController(text: widget.driver.lastName);
    _emailController = TextEditingController(text: widget.driver.email);
    _phoneController = TextEditingController(text: widget.driver.phone);
    _cinController = TextEditingController(text: widget.driver.cin);
  }

  void _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your email address.';
        valid = false;
      });
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(value)) {
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

  void _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your first name.';
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = 'First name must be at least 3 characters long.';
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
        errorMessage.value = 'Please enter your last name.';
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = 'Last name must be at least 3 characters long.';
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
        errorMessage.value = 'Please enter your CIN.';
        valid = false;
      });
    } else if (value.length != 8) {
      setState(() {
        errorMessage.value = 'CIN must be exactly 8 digits long.';
        valid = false;
      });
    } else if (value[0] != '0' && value[0] != '1') {
      setState(() {
        errorMessage.value = 'CIN must start with 0 or 1.';
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
        errorMessage.value = 'Please enter your phone number.';
        valid = false;
      });
    } else if (value.length != 8) {
      setState(() {
        errorMessage.value = 'Phone number must be exactly 8 digits long.';
        valid = false;
      });
    } else if (!['2', '3', '4', '5', '7', '9'].contains(value[0])) {
      setState(() {
        errorMessage.value = "This phone number isn't a tunisian number.";
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
    final driver = widget.driver.copyWith(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      cin: _cinController.text,
    );
    context
        .read<DriverBloc>()
        .add(UpdateDriverEvent(driver: driver, id: driver.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<DriverBloc, DriverState>(
          listener: (context, state) {
            if (state is UpdateDriverSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "Driver added succesfully",
                ),
              );
              context.router.back();
            }
            if (state is UpdateDriverFailed) {
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
                  const ScreenTitle(
                    title: "Update Driver",
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppFormField(
                          hintText: "First Name",
                          controller: _firstNameController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: "Last Name",
                          controller: _lastNameController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
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
                        AppFormField(
                          hintText: "CIN",
                          controller: _cinController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: "Phone Number",
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
                      bottonText: "Update Driver",
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
