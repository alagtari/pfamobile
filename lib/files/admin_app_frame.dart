import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/files/bottom_navigation_icon_widget.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class AdminAppFrame extends StatefulWidget {
  const AdminAppFrame({super.key});

  @override
  State<AdminAppFrame> createState() => _AdminAppFrameState();
}

class _AdminAppFrameState extends State<AdminAppFrame> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.router.replace(const AdminHomeRoute());
        break;
      case 1:
        context.router.replace(const AdminChatRoomsRoute());
        break;
      case 2:
        context.router.replace(const ReportsRoute());
        break;
      case 3:
        context.router.replace(const ProfileRoute());
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
            label: context.l10n.report,
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
