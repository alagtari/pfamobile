import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/features/city/data/models/city_model.dart';
import 'package:mobile/features/city/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class UpdateCityScreen extends StatefulWidget implements AutoRouteWrapper {
  const UpdateCityScreen({
    super.key,
    required this.city,
  });

  final CityModel city;

  @override
  _UpdateCityScreenState createState() => _UpdateCityScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CityBloc(),
        child: this,
      );
}

class _UpdateCityScreenState extends State<UpdateCityScreen> {
  late TextEditingController _postalCodeController;
  late TextEditingController _nameController;

  late ValueNotifier<String> errorMessage;
  late bool valid;

  void _validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter the city postal code.';
        valid = false;
      });
    } else {
      bool isValid = int.tryParse(value) != null &&
          int.parse(value) > 1000 &&
          int.parse(value) < 10000;

      if (!isValid) {
        setState(() {
          errorMessage.value = 'Invalid city postal code.';
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
        errorMessage.value = 'Please enter the city name.';
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = 'City name must be at least 3 characters long.';
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
    _postalCodeController = TextEditingController(text: widget.city.postalCode);
    _nameController = TextEditingController(text: widget.city.name);
  }

  void _onSubmit() {
    _validateName(_nameController.text);
    if (!valid) return;
    _validatePostalCode(_postalCodeController.text);
    if (!valid) return;

    final city = widget.city.copyWith(
      name: _nameController.text,
      postalCode: _postalCodeController.text,
    );
    context.read<CityBloc>().add(UpdateCityEvent(
          city: city,
          id: city.id!,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            if (state is UpdateCitySuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "City added succesfully",
                ),
              );
              context.router.back();
            }

            if (state is UpdateCityFailed) {
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
                    title: "Update City",
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppFormField(
                          hintText: "Name",
                          controller: _nameController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: "Postal Code",
                          controller: _postalCodeController,
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
                      bottonText: "Update City",
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
