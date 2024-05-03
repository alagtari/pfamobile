import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
class CitizenCalendarScreen extends StatefulWidget {
  const CitizenCalendarScreen({
    super.key,
  });

  @override
  State<CitizenCalendarScreen> createState() => _CitizenCalendarScreenState();
}

class _CitizenCalendarScreenState extends State<CitizenCalendarScreen> {
  late ValueNotifier<DateTime> _focusedDay;
  late DateTime? _selectedDay;

  @override
  void initState() {
    _focusedDay = ValueNotifier(DateTime.now());
    _selectedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Row(
                    children: [
                      Text(
                        "02",
                        style: TextStyles.extraExtraLargeTextStyle.copyWith(
                          fontSize: 50,
                          color: AppColors.whiteDarkColor,
                        ),
                      ),
                      miniHorizantalSpacer,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Thursday",
                            style: TextStyles.largeTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteDarkColor,
                            ),
                          ),
                          Text(
                            "Mars 2024",
                            style: TextStyles.largeTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteDarkColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  TableCalendar(
                    daysOfWeekHeight: 35,
                    focusedDay: _focusedDay.value,
                    headerVisible: false,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
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
                child: const Column(
                  children: [
                    CalendarSlotWidget(),
                    extraSmallVerticalSpacer,
                    CalendarSlotWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
