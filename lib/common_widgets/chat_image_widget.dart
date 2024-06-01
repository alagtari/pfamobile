import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/features/chat/data/models/user_preview_model.dart';
import 'package:mobile/theme/colors.dart';

class ChatImageWidget extends StatelessWidget {
  const ChatImageWidget({
    super.key,
    required this.user,
  });

  final UserPreviewModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: AppColors.whiteDarkColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: user.image != null
                  ? NetworkImage(
                      "${dotenv.env['IMAGE_BASE_URL']}/${user.image}")
                  : const AssetImage('assets/images/profile.jpg')
                      as ImageProvider, // Use FileImage constructor
            ),
          ),
        ),
      ),
    );
  }
}
