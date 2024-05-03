import 'package:flutter/cupertino.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class RecivedMessageWidget extends StatelessWidget {
  const RecivedMessageWidget({
    super.key,
    required this.first,
    required this.text,
  });

  final bool first;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .7,
        ),
        margin: EdgeInsets.only(top: first ? 15 : 2),
        padding: const EdgeInsets.all(
          15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.greySoftColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            extraMiniVerticalSpacer,
            Text(
              '12:00 PM',
              style: TextStyles.extraSmallTextStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
