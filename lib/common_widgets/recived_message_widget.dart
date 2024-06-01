import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/admin/chat/data/models/message_model.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class RecivedMessageWidget extends StatelessWidget {
  const RecivedMessageWidget({
    super.key,
    required this.first,
    required this.message,
  });

  final bool first;
  final MessageModel message;

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
              message.content,
              style: TextStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            extraMiniVerticalSpacer,
            Text(
              DateFormat('hh:mm a').format(message.createdAt!.toLocal()),
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
