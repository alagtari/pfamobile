import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_date_picker.dart';
import 'package:mobile/common_widgets/app_dropdown_widget.dart';
import 'package:mobile/common_widgets/app_time_picker.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/core/enums/mission_enum.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/features/admin/plan/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';
import 'package:mobile/features/admin/truck/presentation/bloc/bloc.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@RoutePage()
class AddPlanScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddPlanScreen({super.key});

  @override
  _AddPlanScreenState createState() => _AddPlanScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => PlanBloc(),
          ),
          BlocProvider(
            create: (_) => TruckBloc()..add(GetTrucksEvent()),
          ),
          BlocProvider(
            create: (_) => CityBloc()..add(GetCitiesEvent()),
          ),
        ],
        child: this,
      );
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  late ValueNotifier<String> errorMessage;
  late bool valid;

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  DateTime? _date;

  late ValueNotifier<TruckModel?> _truck;
  late ValueNotifier<List<DropdownMenuItem>> _truckItems;
  late ValueNotifier<List<TruckModel>> _trucks;

  late ValueNotifier<CityModel?> _city;
  late ValueNotifier<List<DropdownMenuItem>> _cityItems;
  late ValueNotifier<List<CityModel>> _cities;

  late ValueNotifier<String?> _garbageType;
  final List<DropdownMenuItem> _garbageTypeItems = const [
    DropdownMenuItem(
      value: 'plastic',
      child: Text(
        'Plastic',
        style: TextStyle(
          color: AppColors.greyDarkColor,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'glass',
      child: Text(
        'Glass',
        style: TextStyle(
          color: AppColors.greyDarkColor,
        ),
      ),
    ),
  ];

  void selectStartTime(TimeOfDay time) {
    setState(() {
      _startTime = time;
    });
  }

  void selectEndTime(TimeOfDay time) {
    setState(() {
      _endTime = time;
    });
  }

  void onDateSelected(DateTime date) {
    setState(() {
      _date = date;
    });
  }

  void changeTruck(String truck) {
    setState(() {
      _truck.value = _trucks.value.firstWhere(
        (element) => element.id == truck,
      );
    });
  }

  void changeCity(String city) {
    setState(() {
      _city.value = _cities.value.firstWhere(
        (element) => element.id == city,
      );
    });
  }

  void changeGarbageType(String garbageType) {
    setState(() {
      _garbageType.value = garbageType;
    });
  }

  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;

    _truck = ValueNotifier<TruckModel?>(null);
    _truckItems = ValueNotifier<List<DropdownMenuItem>>([]);
    _trucks = ValueNotifier<List<TruckModel>>([]);

    _city = ValueNotifier<CityModel?>(null);
    _cityItems = ValueNotifier<List<DropdownMenuItem>>([]);
    _cities = ValueNotifier<List<CityModel>>([]);

    _garbageType = ValueNotifier<String?>(null);
  }

  void _onSubmit() {
    if (_startTime == null) {
      setState(() {
        errorMessage.value = context.l10n.start_time_required;
      });
      return;
    }
    if (_endTime == null) {
      setState(() {
        errorMessage.value = context.l10n.end_time_required;
      });
      return;
    }
    if (_date == null) {
      setState(() {
        errorMessage.value = context.l10n.date_required;
      });
      return;
    }
    if (_truck.value == null) {
      setState(() {
        errorMessage.value = context.l10n.truck_required;
      });
      return;
    }
    if (_city.value == null) {
      setState(() {
        errorMessage.value = context.l10n.city_required;
      });
      return;
    }
    if (_garbageType.value == null) {
      setState(() {
        errorMessage.value = context.l10n.garbage_type_required;
      });
      return;
    }
    DateTime startTime = DateTime(
      _date!.year,
      _date!.month,
      _date!.day,
      _startTime!.hour,
      _startTime!.minute,
    );
    DateTime endTime = DateTime(
      _date!.year,
      _date!.month,
      _date!.day,
      _endTime!.hour,
      _endTime!.minute,
    );
    final plan = PlanModel(
      date: _date!,
      startHour: startTime,
      endHour: endTime,
      city: _city.value!,
      truck: _truck.value!,
      garbageType: _garbageType.value!,
      status: MissionStatus.not_started,
    );
    context.read<PlanBloc>().add(AddPlanEvent(plan: plan));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<PlanBloc, PlanState>(
              listener: (context, state) {
                if (state is AddPlanSuccess) {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: "Plan added succesfully",
                    ),
                  );
                  context.router.back();
                }
                if (state is AddPlanFailed) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: state.message,
                    ),
                  );
                }
              },
            ),
            BlocListener<TruckBloc, TruckState>(
              listener: (context, state) {
                if (state is GetTrucksSuccess) {
                  setState(() {
                    _trucks.value = state.trucks;
                    _truckItems.value = state.trucks
                        .map(
                          (item) => DropdownMenuItem(
                            value: item.id!,
                            child: Text(
                              item.number,
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
            ),
            BlocListener<CityBloc, CityState>(
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
            )
          ],
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              child: Column(
                children: [
                  ScreenTitle(
                    title: context.l10n.add_plan,
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppTimePickerField(
                          onTimeSelected: selectStartTime,
                          hint: context.l10n.start_date,
                        ),
                        extraSmallVerticalSpacer,
                        AppTimePickerField(
                          onTimeSelected: selectEndTime,
                          hint: context.l10n.end_date,
                        ),
                        extraSmallVerticalSpacer,
                        AppDatePickerField(
                          onDateSelected: onDateSelected,
                          hint: context.l10n.date,
                        ),
                        extraSmallVerticalSpacer,
                        AppDropdownWidget(
                          items: _cityItems.value,
                          onChange: changeCity,
                          hint: context.l10n.city,
                          icon: Icons.location_city,
                        ),
                        extraSmallVerticalSpacer,
                        AppDropdownWidget(
                          items: _truckItems.value,
                          onChange: changeTruck,
                          hint: context.l10n.truck,
                          icon: Icons.fire_truck,
                        ),
                        extraSmallVerticalSpacer,
                        AppDropdownWidget(
                          items: _garbageTypeItems,
                          onChange: changeGarbageType,
                          hint: context.l10n.garbage_type,
                          icon: Icons.fire_truck,
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
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: AppBotton(
                      bottonText: context.l10n.add_plan,
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
