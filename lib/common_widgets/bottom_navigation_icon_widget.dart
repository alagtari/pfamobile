import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/theme/colors.dart';

class BottomNavigationIconWidget extends StatelessWidget {
  const BottomNavigationIconWidget({
    super.key,
    required int selectedIndex,
    required this.icon,
    required this.index,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;
  final int index;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: SvgPicture.asset(
        icon,
        width: 22,
        colorFilter: ColorFilter.mode(
          _selectedIndex == index
              ? AppColors.greenDarkColor
              : AppColors.greyDarkColor.withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
