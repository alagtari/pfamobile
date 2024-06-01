import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_dropdown_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/features/admin/driver/data/models/driver_model.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';
import 'package:mobile/features/admin/truck/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class AddTruckScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddTruckScreen({super.key});

  @override
  _AddTruckScreenState createState() => _AddTruckScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => TruckBloc()..add(GetAvailableDriversEvent()),
        child: this,
      );
}

class _AddTruckScreenState extends State<AddTruckScreen> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  late ValueNotifier<String> errorMessage;
  late bool valid;
  late ValueNotifier<DriverModel?> _driver;
  late ValueNotifier<List<DropdownMenuItem>> _items;
  late ValueNotifier<List<DriverModel>> _drivers;

  void changeDriver(String driver) {
    setState(() {
      _driver.value = _drivers.value.firstWhere(
        (element) => element.id == driver,
      );
    });
  }

  void _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.truck_number_prompt;
        valid = false;
      });
    } else {
      List<String> parts = value.split(' ');
      if (parts.length != 3) {
        setState(() {
          errorMessage.value = context.l10n.truck_number_format;
          valid = false;
        });
        return;
      }

      bool isXNumeric = int.tryParse(parts[0]) != null;
      bool isYNumeric = int.tryParse(parts[2]) != null;

      bool isTUN = parts[1] == 'TUN';

      bool isValidX =
          isXNumeric && int.parse(parts[0]) >= 1 && int.parse(parts[0]) <= 300;
      bool isValidY =
          isYNumeric && int.parse(parts[2]) >= 1 && int.parse(parts[2]) <= 9999;

      if (!isTUN || !isValidX || !isValidY) {
        setState(() {
          errorMessage.value = context.l10n.truck_number_format;
          valid = false;
        });
        return;
      }

      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateCapacity(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.truck_capacity_prompt;
        valid = false;
      });
    } else {
      bool isValid = int.tryParse(value) != null && int.parse(value) > 0;

      if (!isValid) {
        setState(() {
          errorMessage.value = context.l10n.invalid_truck_capacity;
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

  void _validateModel(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.truck_model_prompt;
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
    _driver = ValueNotifier<DriverModel?>(null);
    _items = ValueNotifier<List<DropdownMenuItem>>([]);
    _drivers = ValueNotifier<List<DriverModel>>([]);
  }

  void _onSubmit() {
    _validateNumber(_numberController.text);
    if (!valid) return;
    _validateCapacity(_capacityController.text);
    if (!valid) return;
    _validateModel(_modelController.text);
    if (!valid) return;

    final truck = TruckModel(
      number: _numberController.text,
      capacity: int.parse(_capacityController.text),
      model: _modelController.text,
      driver: _driver.value,
    );

    context.read<TruckBloc>().add(AddTruckEvent(truck: truck));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<TruckBloc, TruckState>(
          listener: (context, state) {
            if (state is AddTruckSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "Truck added succesfully",
                ),
              );
              context.router.back();
            }
            if (state is GetAvailableDriversSuccess) {
              setState(() {
                _drivers.value = state.drivers;
                _items.value = state.drivers
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.id!,
                        child: Text(
                          "${item.firstName} ${item.lastName}",
                          style: const TextStyle(
                            color: AppColors.greyDarkColor,
                          ),
                        ),
                      ),
                    )
                    .toList();
              });
            }
            if (state is AddTruckFailed) {
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
                    title: context.l10n.add_truck,
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppFormField(
                          hintText: context.l10n.truck_number,
                          controller: _numberController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: context.l10n.truck_model,
                          controller: _modelController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppFormField(
                          hintText: context.l10n.truck_capacity,
                          controller: _capacityController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.greyDarkColor,
                            size: 20,
                          ),
                        ),
                        extraSmallVerticalSpacer,
                        AppDropdownWidget(
                          items: _items.value,
                          onChange: changeDriver,
                          hint: 'Driver',
                          icon: Icons.supervised_user_circle,
                        ),
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
                      bottonText: context.l10n.add_truck,
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
