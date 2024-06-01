import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class AddCityScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddCityScreen({super.key});

  @override
  _AddCityScreenState createState() => _AddCityScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CityBloc(),
        child: this,
      );
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  late ValueNotifier<String> errorMessage;
  late bool valid;

  void _validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.city_postal_code_prompt;
        valid = false;
      });
    } else {
      bool isValid = int.tryParse(value) != null &&
          int.parse(value) > 1000 &&
          int.parse(value) < 10000;

      if (!isValid) {
        setState(() {
          errorMessage.value = context.l10n.invalid_city_postal_code;
          valid = false;
        });
      } else {
        setState(() {
          errorMessage.value = '';
          valid = true;
        });
      }
    }
  }

  void _validateName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.city_name_prompt;
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = context.l10n.city_name_length_error;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateState(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.state_name_prompt;
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = context.l10n.state_length_error;
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
    _validateState(_stateController.text);
    if (!valid) return;
    _validateName(_nameController.text);
    if (!valid) return;
    _validatePostalCode(_postalCodeController.text);
    if (!valid) return;

    context.read<CityBloc>().add(
          VerifyCityEvent(
            name: _nameController.text,
            state: _stateController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            if (state is AddCitySuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "City added succesfully",
                ),
              );
              context.router.back();
            }

            if (state is AddCityFailed) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
            if (state is VerifyCitySuccess) {
              context.router.replace(
                VerifyCityRoute(
                  location: state.location,
                  name: _nameController.text,
                  state: _stateController.text,
                  postalCode: _postalCodeController.text,
                ),
              );
            }
            if (state is VerifyCityFailed) {
              setState(() {
                errorMessage.value = state.message;
              });
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
                    title: context.l10n.add_city,
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppFormField(
                          hintText: context.l10n.state,
                          controller: _stateController,
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: context.l10n.name,
                          controller: _nameController,
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: context.l10n.postal_code,
                          controller: _postalCodeController,
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
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
                      bottonText: context.l10n.add_city,
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
