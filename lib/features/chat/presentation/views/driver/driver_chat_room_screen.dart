import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_chat_form_field.dart';
import 'package:mobile/common_widgets/recived_message_widget.dart';
import 'package:mobile/common_widgets/sent_message_widget.dart';
import 'package:mobile/core/common_used/socket_service.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/chat/data/models/driver_message_model.dart';
import 'package:mobile/features/chat/data/models/message_model.dart';
import 'package:mobile/features/chat/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';

@RoutePage()
class DriverChatRoomScreen extends StatefulWidget implements AutoRouteWrapper {
  const DriverChatRoomScreen({
    super.key,
  });

  @override
  State<DriverChatRoomScreen> createState() => _DriverChatRoomScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ChatBloc()
          ..add(
            GetDriverRoomMessagesEvent(),
          ),
        child: this,
      );
}

class _DriverChatRoomScreenState extends State<DriverChatRoomScreen> {
  final SocketService _socketService = sl<SocketService>();
  late Stream<List<MessageModel>> _messages;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();
  final ValueNotifier<List<MessageModel>> _messagesNotifier =
      ValueNotifier<List<MessageModel>>([]);
  @override
  void initState() {
    _messages = _socketService.messages;
    _messages.listen((newMessages) {
      if (newMessages.isNotEmpty) {
        _scrollToBottom();
      }
    });
    super.initState();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.greenDarkColor,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocListener<ChatBloc, ChatState>(
                listener: (context, state) {
                  if (state is GetDriverRoomMessagesSuccess) {
                    setState(() {
                      _messagesNotifier.value = state.messages;
                    });
                    _scrollToBottom();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
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
                  child: ValueListenableBuilder(
                      valueListenable: _messagesNotifier,
                      builder: (context, value, child) {
                        return StreamBuilder<List<MessageModel>>(
                          stream: _messages,
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              value.add(snapshot.data!.last);
                            }
                            return ListView.builder(
                              itemCount: value.length,
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                final bool received = !value[index].sent!;
                                final bool previousReceived =
                                    index > 0 ? !value[index - 1].sent! : false;
                                log(received.toString());
                                return received
                                    ? RecivedMessageWidget(
                                        first: !previousReceived,
                                        message: value[index],
                                      )
                                    : SentMessageWidget(
                                        first: previousReceived,
                                        message: value[index],
                                      );
                              },
                            );
                          },
                        );
                      }),
                ),
              ),
            ),
            Container(
              color: AppColors.whiteDarkColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: AppChatFormField(
                      hintText: "hintText",
                      controller: controller,
                    ),
                  ),
                  miniHorizantalSpacer,
                  GestureDetector(
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        final message = DriverMessageModel(
                          content: controller.text,
                        );
                        context.read<ChatBloc>().add(
                              SendDriverMessageEvent(message: message),
                            );
                        controller.text = "";
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.greenLightColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.send_rounded,
                        color: AppColors.greenDarkColor,
                      ),
                    ),
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
