import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/citizen/calendar/data/models/citizen_plan_model.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class CalendarSlotWidget extends StatelessWidget {
  CalendarSlotWidget({
    super.key,
    required this.plan,
  });
  final CitizenPlanModel plan;
  final formatter = DateFormat('HH:mm');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.greenLightColor,
                borderRadius: BorderRadius.circular(15)),
            height: 50,
            width: 50,
            child: const Center(
              child: Icon(
                Icons.delete,
                color: AppColors.greenDarkColor,
                size: 35,
              ),
            ),
          ),
          extraSmallHorizantalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${formatter.format(plan.startHour)}-${formatter.format(plan.endHour)}",
                style: TextStyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyDarkColor),
              ),
              Text(
                plan.garbageType,
                style: TextStyles.largeTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
