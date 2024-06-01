import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/util/utils.dart';
import 'package:mobile/features/admin/chat/data/models/room_model.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class ChatRoomPreviewWidget extends StatelessWidget {
  const ChatRoomPreviewWidget({
    super.key,
    required this.room,
  });

  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          AdminChatRoomRoute(room: room),
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
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: room.user.image != null
                      ? NetworkImage(
                          "${dotenv.env['IMAGE_BASE_URL']}/${room.user.image}")
                      : const AssetImage('assets/images/profile.jpg')
                          as ImageProvider, // Use FileImage constructor
                ),
              ),
            ),
            miniHorizantalSpacer,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${room.user.firstName} ${room.user.lastName}"
                        .capitalizeWords(),
                    style: TextStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenDarkColor),
                  ),
                  extraMiniVerticalSpacer,
                  Text(
                    room.latestMessage?.content ?? "No message",
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
                room.latestMessage?.createdAt != null
                    ? Text(
                        DateFormat('hh:mm a')
                            .format(room.latestMessage!.createdAt!.toLocal()),
                        style: TextStyles.extraSmallTextStyle.copyWith(
                          color: AppColors.blackDarkColor,
                        ),
                      )
                    : const SizedBox(),
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
