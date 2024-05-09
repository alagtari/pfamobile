import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:mobile/core/util/utils.dart';

class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField({
    super.key,
    required this.onDateSelected,
    required this.hint,
    this.initialDate,
  });
  final void Function(DateTime time) onDateSelected;
  final String hint;
  final DateTime? initialDate;
  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> {
  DateTime? _selectedDate;

  void _pickDate() async {
    final time = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030, 12, 31),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (time != null) {
      setState(() {
        _selectedDate = time;
      });
      widget.onDateSelected(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(),
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 25),
        decoration: const BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.all(
            CustomRaius.smallRadius,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month,
              size: 20,
              color: AppColors.greyDarkColor,
            ),
            miniHorizantalSpacer,
            Text(
              (_selectedDate?.formatDayMonthYear() ??
                  widget.initialDate?.formatDayMonthYear() ??
                  widget.hint),
              style: TextStyles.mediumTextStyle.copyWith(
                color: AppColors.greyDarkColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
