import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const CategoryRoute());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        width: MediaQuery.of(context).size.width * .26,
        decoration: BoxDecoration(
          color: AppColors.greenLightColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              height: MediaQuery.of(context).size.height * .085,
            ),
            extraSmallVerticalSpacer,
            Text(
              title,
              style: TextStyles.smallTextStyle.copyWith(
                  color: AppColors.greenDarkColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
