import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/chat_room_preview_widget.dart';
import 'package:mobile/core/common_used/socket_service.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/chat/data/models/message_model.dart';
import 'package:mobile/features/chat/data/models/room_model.dart';
import 'package:mobile/features/chat/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';

@RoutePage()
class AdminChatRoomsScreen extends StatefulWidget implements AutoRouteWrapper {
  const AdminChatRoomsScreen({
    super.key,
  });

  @override
  State<AdminChatRoomsScreen> createState() => _AdminChatRoomsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ChatBloc()..add(GetRoomsEvent()),
        child: this,
      );
}

class _AdminChatRoomsScreenState extends State<AdminChatRoomsScreen> {
  final SocketService _socketService = sl<SocketService>();
  late Stream<List<MessageModel>> _messages;

  @override
  void initState() {
    _messages = _socketService.messages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenDarkColor,
      body: SafeArea(
        child: Column(
          children: [
            smallVerticalSpacer,
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is GetRoomsSuccess) {
                    List<RoomModel> rooms = state.rooms;
                    return Container(
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
                      child: StreamBuilder<List<MessageModel>>(
                        stream: _messages,
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            log(snapshot.data!.length.toString());
                            rooms = rooms.map((e) {
                              log((snapshot.data!.last.roomId).toString());
                              log((e.id).toString());
                              log((e.id == snapshot.data!.last.roomId)
                                  .toString());
                              return e.id == snapshot.data!.last.roomId
                                  ? e.copyWith(
                                      message: snapshot.data!.last,
                                    )
                                  : e;
                            }).toList();
                            rooms.sort(
                              (a, b) => b.latestMessage!.createdAt!
                                  .compareTo(a.latestMessage!.createdAt!),
                            );
                          }

                          return ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              return ChatRoomPreviewWidget(room: rooms[index]);
                            },
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
