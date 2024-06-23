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
class UpdatePlanScreen extends StatefulWidget implements AutoRouteWrapper {
  const UpdatePlanScreen({super.key, required this.plan});

  final PlanModel plan;

  @override
  _UpdatePlanScreenState createState() => _UpdatePlanScreenState();

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

class _UpdatePlanScreenState extends State<UpdatePlanScreen> {
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
  final ValueNotifier<List<DropdownMenuItem>> _garbageTypeItems =
      ValueNotifier<List<DropdownMenuItem>>(const [
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
  ]);

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

    _garbageType = ValueNotifier<String?>(widget.plan.garbageType);
    _startTime = TimeOfDay.fromDateTime(widget.plan.startHour.toLocal());
    _endTime = TimeOfDay.fromDateTime(widget.plan.endHour.toLocal());
    _date = widget.plan.date.toLocal();
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
    final plan = widget.plan.copyWith(
      date: _date!,
      startHour: startTime,
      endHour: endTime,
      city: _city.value!,
      truck: _truck.value!,
      garbageType: _garbageType.value!,
    );
    context
        .read<PlanBloc>()
        .add(UpdatePlanEvent(plan: plan, id: widget.plan.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<PlanBloc, PlanState>(
              listener: (context, state) {
                if (state is UpdatePlanSuccess) {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: "Plan added succesfully",
                    ),
                  );
                  context.router.back();
                }
                if (state is UpdatePlanFailed) {
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
                    _truck.value = widget.plan.truck;
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
                    _city.value = widget.plan.city;
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
                  const ScreenTitle(
                    title: "Update Plan",
                    arrowBack: true,
                  ),
                  largeVerticalSpacer,
                  Expanded(
                    child: Column(
                      children: [
                        AppTimePickerField(
                          onTimeSelected: selectStartTime,
                          hint: context.l10n.start_date,
                          initialValue: widget.plan.startHour.toLocal(),
                        ),
                        extraSmallVerticalSpacer,
                        AppTimePickerField(
                          onTimeSelected: selectEndTime,
                          hint: context.l10n.end_date,
                          initialValue: widget.plan.endHour.toLocal(),
                        ),
                        extraSmallVerticalSpacer,
                        AppDatePickerField(
                          onDateSelected: onDateSelected,
                          hint: context.l10n.date,
                          initialDate: widget.plan.date.toLocal(),
                        ),
                        extraSmallVerticalSpacer,
                        ValueListenableBuilder(
                          valueListenable: _cityItems,
                          builder: (context, value, child) {
                            return AppDropdownWidget(
                              items: _cityItems.value,
                              onChange: changeCity,
                              hint: context.l10n.city,
                              icon: Icons.location_city,
                              initialValue:
                                  value.isNotEmpty ? widget.plan.city.id : null,
                            );
                          },
                        ),
                        extraSmallVerticalSpacer,
                        ValueListenableBuilder(
                          valueListenable: _truckItems,
                          builder: (context, value, child) {
                            return AppDropdownWidget(
                              items: _truckItems.value,
                              onChange: changeTruck,
                              hint: context.l10n.truck,
                              icon: Icons.fire_truck,
                              initialValue: value.isNotEmpty
                                  ? widget.plan.truck.id
                                  : null,
                            );
                          },
                        ),
                        extraSmallVerticalSpacer,
                        ValueListenableBuilder(
                          valueListenable: _garbageTypeItems,
                          builder: (context, value, child) {
                            return AppDropdownWidget(
                              items: _garbageTypeItems.value,
                              onChange: changeGarbageType,
                              hint: context.l10n.garbage_type,
                              icon: Icons.fire_truck,
                              initialValue: value.isNotEmpty
                                  ? widget.plan.garbageType
                                  : null,
                            );
                          },
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
                      bottonText: "Update plan",
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
