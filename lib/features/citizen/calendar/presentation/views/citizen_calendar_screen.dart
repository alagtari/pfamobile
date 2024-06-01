import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/citizen/calendar/data/models/citizen_plan_model.dart';
import 'package:mobile/features/citizen/calendar/presentation/bloc/bloc.dart';
import 'package:mobile/files/calendar_slot_widget.dart';
import 'package:mobile/files/day_name.dart';
import 'package:mobile/files/disabled_day.dart';
import 'package:mobile/files/normal_day.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/files/selected_day.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class CitizenCalendarScreen extends StatefulWidget implements AutoRouteWrapper {
  const CitizenCalendarScreen({
    super.key,
  });

  @override
  State<CitizenCalendarScreen> createState() => _CitizenCalendarScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => CalendarBloc(),
        child: this,
      );
}

class _CitizenCalendarScreenState extends State<CitizenCalendarScreen> {
  late ValueNotifier<DateTime> _focusedDay;
  late ValueNotifier<List<CitizenPlanModel>> _plans;
  late DateTime? _selectedDay;
  final formatter = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    _focusedDay = ValueNotifier(DateTime.now());
    _selectedDay = DateTime.now();
    _plans = ValueNotifier([]);
    context
        .read<CalendarBloc>()
        .add(GetCalendarsEvent(date: formatter.format(DateTime.now())));
    _focusedDay.addListener(() {
      final date = _focusedDay.value;
      context
          .read<CalendarBloc>()
          .add(GetCalendarsEvent(date: formatter.format(date)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalendarBloc, CalendarState>(
      listener: (context, state) {
        if (state is GetCalendarsSuccess) {
          setState(() {
            _plans.value = state.plans;
          });
        }
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.greenDarkColor,
        child: SafeArea(
          child: Column(
            children: [
              const ScreenTitle(
                title: "Calendar",
                color: AppColors.whiteDarkColor,
                arrowBack: false,
              ),
              extraExtraLargeVerticalSpacer,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    ValueListenableBuilder<DateTime>(
                      valueListenable: _focusedDay,
                      builder: (context, date, _) {
                        // Format the date to display the day, weekday, and month
                        String day = DateFormat('dd').format(date);
                        String weekday = DateFormat('EEEE').format(date);
                        String monthYear = DateFormat('MMMM yyyy').format(date);

                        return Row(
                          children: [
                            Text(
                              day,
                              style:
                                  TextStyles.extraExtraLargeTextStyle.copyWith(
                                fontSize: 50,
                                color: AppColors.whiteDarkColor,
                              ),
                            ),
                            miniHorizantalSpacer,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weekday,
                                  style: TextStyles.largeTextStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteDarkColor,
                                  ),
                                ),
                                Text(
                                  monthYear,
                                  style: TextStyles.largeTextStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteDarkColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    TableCalendar(
                      daysOfWeekHeight: 35,
                      focusedDay: _focusedDay.value,
                      headerVisible: false,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay) &&
                            selectedDay.month == _focusedDay.value.month) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay.value = focusedDay;
                          });
                        }
                      },
                      calendarFormat: CalendarFormat.month,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder: (context, day, focusedDay) {
                          return SelectedDay(
                            day: day,
                          );
                        },
                        todayBuilder: (context, day, focusedDay) {
                          return NormalDay(
                            day: day,
                          );
                        },
                        defaultBuilder: (context, day, focusedDay) {
                          return NormalDay(
                            day: day,
                          );
                        },
                        outsideBuilder: (context, day, focusedDay) {
                          return DisabledDay(
                            day: day,
                          );
                        },
                        dowBuilder: (context, day) {
                          return DayName(day: day);
                        },
                      ),
                      onPageChanged: (focusedDay) {
                        _focusedDay.value = focusedDay;
                      },
                    ),
                  ],
                ),
              ),
              miniVerticalSpacer,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteDarkColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: ValueListenableBuilder<List<CitizenPlanModel>>(
                    valueListenable: _plans,
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return CalendarSlotWidget(
                            plan: value[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
