import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/files/chat_image_widget.dart';
import 'package:mobile/files/chat_room_preview_widget.dart';
import 'package:mobile/files/day_name.dart';
import 'package:mobile/files/disabled_day.dart';
import 'package:mobile/files/normal_day.dart';
import 'package:mobile/files/recived_message_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/files/selected_day.dart';
import 'package:mobile/files/sent_message_widget.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class AdminChatRoomScreen extends StatefulWidget {
  const AdminChatRoomScreen({
    super.key,
  });

  @override
  State<AdminChatRoomScreen> createState() => _AdminChatRoomScreenState();
}

class _AdminChatRoomScreenState extends State<AdminChatRoomScreen> {
  final _messages = [
    {"received": true, "message": "Hey, how's it going?"},
    {"received": false, "message": "Hi! I'm doing well, thanks for asking."},
    {"received": true, "message": "That's good to hear!"},
    {"received": false, "message": "Yeah, I had a pretty good day."},
    {"received": false, "message": "Did you watch the game last night?"},
    {"received": true, "message": "No, I missed it. Who won?"},
    {"received": false, "message": "The Eagles won 27-20."},
    {"received": true, "message": "Nice, I'll have to catch the highlights."},
    {
      "received": true,
      "message": "Hey, can you send me the report by tomorrow?"
    },
    {"received": false, "message": "Sure thing, I'll have it ready for you."},
    {"received": true, "message": "Thanks!"},
    {"received": false, "message": "No problem."},
    {"received": false, "message": "What time is our meeting tomorrow?"},
    {"received": true, "message": "It's at 10:00 AM."},
    {"received": false, "message": "Got it, see you then."},
    {"received": true, "message": "Hey, do you want to grab lunch tomorrow?"},
    {"received": false, "message": "I can't tomorrow, but how about Friday?"},
    {"received": true, "message": "Friday works for me."},
    {"received": false, "message": "Great, let's do it."},
    {"received": true, "message": "Did you hear about the new project?"},
    {"received": false, "message": "No, what's it about?"},
    {"received": true, "message": "I'll fill you in at the meeting."},
    {"received": false, "message": "Sounds good."},
    {
      "received": false,
      "message": "Have you seen the latest episode of that show?"
    },
    {
      "received": true,
      "message": "No, I haven't had a chance to watch it yet."
    },
    {
      "received": false,
      "message": "It's really good, you should check it out."
    },
    {"received": true, "message": "I'll add it to my list."},
    {"received": true, "message": "Hey, can you help me with this problem?"},
    {"received": false, "message": "Sure, what's going on?"},
    {"received": true, "message": "I keep getting an error message."},
    {"received": false, "message": "Let me take a look."}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.greenDarkColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .075,
              ),
              child: Row(
                children: [
                  const ChatImageWidget(),
                  miniHorizantalSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ala Gtari",
                        style: TextStyles.mediumTextStyle.copyWith(
                          color: AppColors.whiteDarkColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Online",
                        style: TextStyles.extraSmallTextStyle.copyWith(
                          color: AppColors.whiteDarkColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 2,
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
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final bool received = _messages[index]['received'] as bool;
                    final bool previousReceived = index > 0
                        ? _messages[index - 1]['received'] as bool
                        : false;
                    final String message =
                        _messages[index]['message'] as String;

                    return received
                        ? RecivedMessageWidget(first: !previousReceived,text: message)
                        : SentMessageWidget(first: previousReceived,text: message);
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
