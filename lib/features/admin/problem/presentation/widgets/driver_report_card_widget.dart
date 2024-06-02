import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/core/util/utils.dart';
import 'package:mobile/features/admin/problem/data/models/problem_model.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class DriverReportCardWidget extends StatelessWidget {
  const DriverReportCardWidget({
    super.key,
    required this.incident,
  });
  final ProblemModel incident;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(25),
      dashPattern: const [7, 4],
      strokeWidth: 1,
      color: AppColors.greyDarkColor,
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: 180,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.greyLightColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: incident.user.image != null
                          ? NetworkImage(
                              "${dotenv.env['IMAGE_BASE_URL']}/${incident.user.image}")
                          : const AssetImage('assets/images/profile.jpg')
                              as ImageProvider,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                extraMiniHorizantalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${incident.user.firstName.capitalize()} ${incident.user.lastName.capitalize()}",
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      incident.createdAt.formatDayMonthYear(),
                      style: TextStyles.extraSmallTextStyle.copyWith(
                        color: AppColors.greyDarkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            ),
            miniVerticalSpacer,
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                incident.content,
                style: TextStyles.extraSmallTextStyle
                    .copyWith(color: AppColors.greyDarkColor, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
