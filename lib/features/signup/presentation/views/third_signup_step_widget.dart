import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_dropdown_widget.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/features/city/data/models/city_model.dart';
import 'package:mobile/features/city/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';

class ThirdSignupStepWidget extends StatefulWidget {
  const ThirdSignupStepWidget({
    super.key,
    required this.submit,
  });

  final Function(
    String city,
    String street,
  ) submit;
  @override
  State<ThirdSignupStepWidget> createState() => _ThirdSignupStepWidgetState();
}

class _ThirdSignupStepWidgetState extends State<ThirdSignupStepWidget> {
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  late ValueNotifier<List<DropdownMenuItem>> _cityItems;
  late ValueNotifier<CityModel?> _city;
  late ValueNotifier<List<CityModel>> _cities;

  @override
  void initState() {
    super.initState();
    _city = ValueNotifier<CityModel?>(null);
    _cityItems = ValueNotifier<List<DropdownMenuItem>>([]);
    _cities = ValueNotifier<List<CityModel>>([]);
  }

  void changeCity(String city) {
    setState(() {
      _city.value = _cities.value.firstWhere(
        (element) => element.id == city,
      );
      _postalCodeController.text = _city.value!.postalCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CityBloc, CityState>(
      listener: (context, state) {
        if (state is GetCitiesSuccess) {
          setState(() {
            _cities.value = state.cities;
            _cityItems.value = state.cities
                .map(
                  (item) => DropdownMenuItem(
                    value: item.id!,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: AppColors.greyDarkColor,
                      ),
                    ),
                  ),
                )
                .toList();
          });
        }
      },
      child: Expanded(
        child: Column(
          children: [
            extraMiniVerticalSpacer,
            extraSmallVerticalSpacer,
            AppDropdownWidget(
              items: _cityItems.value,
              onChange: changeCity,
              hint: context.l10n. city,
              icon: Icons.location_on_outlined,
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              hintText: context.l10n.postal_code,
              controller: _postalCodeController,
              readOnly: true,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              hintText: context.l10n.street,
              controller: _streetController,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            AppBotton(
              bottonText: context.l10n.finish,
              onClick: () {
                widget.submit(_city.value!.id!, _streetController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
