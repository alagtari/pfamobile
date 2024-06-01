import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/common_widgets/bottom_navigation_icon_widget.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class CitizenAppFrame extends StatefulWidget {
  const CitizenAppFrame({super.key});

  @override
  State<CitizenAppFrame> createState() => _CitizenAppFrameState();
}

class _CitizenAppFrameState extends State<CitizenAppFrame> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.router.replace(const CitizenHomeRoute());
        break;
      case 1:
        context.router.replace(const CitizenCalendarRoute());
        break;
      case 2:
        context.router.replace(const CitizenProblemRoute());
        break;
      case 3:
        context.router.replace(const CitizenProfileRoute());
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 1,
              icon: 'assets/svg/calendar_icon.svg',
            ),
            label: 'Calendar',
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
            label: 'Profile',
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
