import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

class SelectedDay extends StatelessWidget {
  const SelectedDay({
    super.key,
    required this.day,
  });

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: AppColors.whiteDarkColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.day.toString(),
            style: TextStyles.extraLargeTextStyle.copyWith(
              color: AppColors.greenDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
