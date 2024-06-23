import 'package:flutter/material.dart';
import 'package:mobile/core/util/utils.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class AppTimePickerField extends StatefulWidget {
  const AppTimePickerField({
    super.key,
    required this.onTimeSelected,
    required this.hint,
    this.initialValue,
  });
  final void Function(TimeOfDay time) onTimeSelected;
  final String hint;
  final DateTime? initialValue;

  @override
  State<AppTimePickerField> createState() => _AppTimePickerFieldState();
}

class _AppTimePickerFieldState extends State<AppTimePickerField> {
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _selectedTime = TimeOfDay.fromDateTime(widget.initialValue!);
    }
    super.initState();
  }

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
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
        _selectedTime = time;
      });
      widget.onTimeSelected(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickTime(),
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
              Icons.access_time,
              size: 20,
              color: AppColors.greyDarkColor,
            ),
            miniHorizantalSpacer,
            Text(
              (_selectedTime?.format24h() ?? widget.hint),
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
