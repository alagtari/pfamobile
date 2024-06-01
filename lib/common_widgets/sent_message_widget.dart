import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/admin/chat/data/models/message_model.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class SentMessageWidget extends StatelessWidget {
  const SentMessageWidget({
    super.key,
    required this.first,
    required this.message,
  });

  final bool first;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .7,
          minWidth: 0,
        ),
        margin: EdgeInsets.only(top: first ? 15 : 2),
        padding: const EdgeInsets.all(
          15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.greenDarkColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: TextStyles.smallTextStyle.copyWith(
                color: AppColors.whiteDarkColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            extraMiniVerticalSpacer,
            Container(
              width: 100,
              child: Row(
                children: [
                  Text(
                    DateFormat('hh:mm a').format(message.createdAt!.toLocal()),
                    style: TextStyles.extraSmallTextStyle.copyWith(
                      color: AppColors.whiteDarkColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  extraMiniHorizantalSpacer,
                  const Icon(
                    Icons.done_all,
                    size: 15,
                    color: AppColors.whiteDarkColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
