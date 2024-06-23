import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/core/util/utils.dart';
import 'package:mobile/features/citizen/home/data/models/notification_model.dart';
import 'package:mobile/features/citizen/home/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget implements AutoRouteWrapper {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => NotificationBloc()..add(GetNotificationsEvent()),
        child: this,
      );
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteDarkColor,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .075),
        child: Column(
          children: [
            const ScreenTitle(
              title: "Notifications",
            ),
            largeVerticalSpacer,
            Expanded(
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is GetNotificationsSuccess) {
                    final notifications = state.notifications;
                    return ListView.builder(
                      primary: false,
                      itemCount: notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            NotificationCardWidget(
                              notification: notifications[index],
                            ),
                          ],
                        );
                      },
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

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.notification,
  });
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .85,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greySoftColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.greenLightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/truck_icon.svg",
              colorFilter: const ColorFilter.mode(
                AppColors.greenDarkColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          miniHorizantalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .69,
                child: Text(
                  notification.content,
                  style: TextStyles.smallTextStyle.copyWith(),
                  maxLines: 2,
                ),
              ),
              Text(
                notification.createdAt.timeAgo(),
                style: TextStyles.extraSmallTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyDarkColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
