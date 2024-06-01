import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/core/common_used/socket_service.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/files/bottom_navigation_icon_widget.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class DriverAppFrame extends StatefulWidget {
  const DriverAppFrame({super.key});

  @override
  State<DriverAppFrame> createState() => _DriverAppFrameState();
}

class _DriverAppFrameState extends State<DriverAppFrame> {
  int _selectedIndex = 0;
  late SocketService _socketService;
  @override
  void initState() {
    _socketService = sl<SocketService>();
    _socketService.initSocket();
    super.initState();
  }

  @override
  void dispose() {
    _socketService.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.router.replace(const DriverPlansRoute());
        break;
      case 1:
        context.router.replace(const DriverChatRoomRoute());
        break;
      case 2:
        context.router.replace(const DriverIncidentRoute());
        break;
      case 3:
        context.router.replace(const DriverProfileRoute());
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AutoRouter(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 0,
              icon: 'assets/svg/home_icon.svg',
            ),
            label: context.l10n.home,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 1,
              icon: 'assets/svg/chat_icon.svg',
            ),
            label: context.l10n.chat,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 2,
              icon: 'assets/svg/report_icon.svg',
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 3,
              icon: 'assets/svg/profile_icon.svg',
            ),
            label: context.l10n.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.greyDarkColor.withOpacity(0.5),
        selectedLabelStyle: TextStyles.extraSmallTextStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyles.extraSmallTextStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: AppColors.greenDarkColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
