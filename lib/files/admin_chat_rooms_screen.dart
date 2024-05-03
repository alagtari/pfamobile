import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/files/calendar_slot_widget.dart';
import 'package:mobile/files/chat_image_widget.dart';
import 'package:mobile/files/chat_room_preview_widget.dart';
import 'package:mobile/files/day_name.dart';
import 'package:mobile/files/disabled_day.dart';
import 'package:mobile/files/normal_day.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/files/selected_day.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class AdminChatRoomsScreen extends StatefulWidget {
  const AdminChatRoomsScreen({
    super.key,
  });

  @override
  State<AdminChatRoomsScreen> createState() => _AdminChatRoomsScreenState();
}

class _AdminChatRoomsScreenState extends State<AdminChatRoomsScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.greenDarkColor,
      child: SafeArea(
        child: Column(
          children: [
            // ChatImageWidget(),
            SizedBox(
                width: double.infinity,
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: ChatImageWidget(),
                          )
                        : const ChatImageWidget();
                  },
                )),

            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.whiteDarkColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ChatRoomPreviewWidget();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
