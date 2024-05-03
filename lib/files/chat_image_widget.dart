import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';

class ChatImageWidget extends StatelessWidget {
  const ChatImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal:6 ),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: AppColors.whiteDarkColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: const DecorationImage(
              image: AssetImage("assets/images/profile.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
