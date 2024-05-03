import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

class DisabledDay extends StatelessWidget {
  const DisabledDay({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.day.toString(),
            style: TextStyles.extraLargeTextStyle.copyWith(
              color: AppColors.whiteSoftColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
