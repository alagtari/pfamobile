import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class DriverCardWidget extends StatelessWidget {
  const DriverCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(30),
        dashPattern: const [7, 4],
        strokeWidth: 1,
        color: AppColors.greyDarkColor,
        child: Stack(
          children: [
            Container(
              height: 160,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyLightColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                  miniHorizantalSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      extraMiniVerticalSpacer,
                      Text(
                        "Ala Gtari",
                        style: TextStyles.largeTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      extraMiniVerticalSpacer,
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.greyLessDarkColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.email_outlined,
                              color: AppColors.greyDarkColor,
                              size: 18,
                            ),
                          ),
                          extraMiniHorizantalSpacer,
                          Text(
                            "ala@gmail.com",
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyDarkColor,
                            ),
                          )
                        ],
                      ),
                      extraMiniVerticalSpacer,
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.greyLessDarkColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.local_phone,
                              color: AppColors.greyDarkColor,
                              size: 18,
                            ),
                          ),
                          extraMiniHorizantalSpacer,
                          Text(
                            "22 222 222",
                            style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyDarkColor,
                            ),
                          )
                        ],
                      ),
                      miniVerticalSpacer,
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.blackDarkColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '199  TUN  2001',
                            style: TextStyles.extraSmallTextStyle.copyWith(
                                color: AppColors.whiteDarkColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                offset: Offset.fromDirection(10),
                color: AppColors.whiteDarkColor,
                surfaceTintColor: AppColors.whiteDarkColor,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'option1',
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_note,
                          color: AppColors.blackDarkColor,
                        ),
                        extraMiniHorizantalSpacer,
                        Text(
                          "Update",
                          style: TextStyles.smallTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackDarkColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'option1',
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          color: AppColors.blackDarkColor,
                        ),
                        extraMiniHorizantalSpacer,
                        Text(
                          "Delete",
                          style: TextStyles.smallTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackDarkColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                child: Container(
                  width: 32,
                  height: 17,
                  decoration: BoxDecoration(
                    color: AppColors.greyLessDarkColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/more_icon.svg",
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyDarkColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
