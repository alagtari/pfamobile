import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

class DayName extends StatelessWidget {
  const DayName({
    super.key,
    required this.day,
  });

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final dayName = DateFormat.E().format(day);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayName,
            style: TextStyles.largeTextStyle.copyWith(
              color: AppColors.whiteSoftColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
