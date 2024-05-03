import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class ChatRoomPreviewWidget extends StatelessWidget {
  const ChatRoomPreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          const AdminChatRoomRoute(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.greyLessDarkColor,
              width: .5,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: const DecorationImage(
                  image: AssetImage("assets/images/profile.jpg"),
                ),
              ),
            ),
            miniHorizantalSpacer,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ala Gtari",
                    style: TextStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenDarkColor),
                  ),
                  extraMiniVerticalSpacer,
                  Text(
                    "Can I also get my cousin along? Will that be okay?",
                    style: TextStyles.smallTextStyle.copyWith(
                      color: AppColors.blackDarkColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            smallHorizantalSpacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "12:25 PM",
                  style: TextStyles.extraSmallTextStyle.copyWith(
                    color: AppColors.blackDarkColor,
                  ),
                ),
                extraMiniVerticalSpacer,
                const Icon(
                  Icons.done_all,
                  size: 20,
                  color: AppColors.greenDarkColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
