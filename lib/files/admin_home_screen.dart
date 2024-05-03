import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({
    super.key,
  });

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
            mediumVerticalSpacer,
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: AppColors.greenLightColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                miniHorizantalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ala Gtari",
                      style: TextStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.greenDarkColor,
                          size: 18,
                        ),
                        Text(
                          "Hammem Linf",
                          style: TextStyles.extraSmallTextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: AppColors.greenLightColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.greenDarkColor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            extraLargeVerticalSpacer,
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .16,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.greenDarkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Take control of your truck management .",
                          style: TextStyles.mediumTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        miniVerticalSpacer,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(const TrucksRoute());
                            },
                            child: Container(
                              width: 85,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.whiteDarkColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Go Now",
                                  style: TextStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greenDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      width: MediaQuery.of(context).size.width * .35,
                      'assets/svg/track.svg',
                    ),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .16,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.greenDarkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Take charge of your driver management .",
                          style: TextStyles.mediumTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        miniVerticalSpacer,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(const DriversRoute());
                            },
                            child: Container(
                              width: 85,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.whiteDarkColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Go Now",
                                  style: TextStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greenDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      width: MediaQuery.of(context).size.width * .35,
                      'assets/svg/driver.svg',
                    ),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .16,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.greenDarkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Seamlessly organize your schedules .",
                          style: TextStyles.mediumTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        miniVerticalSpacer,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(const PlansRoute());
                            },
                            child: Container(
                              width: 85,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.whiteDarkColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Go Now",
                                  style: TextStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greenDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      width: MediaQuery.of(context).size.width * .35,
                      'assets/svg/cans.svg',
                    ),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .16,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.greenDarkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Create & mange the cities and locations .",
                          style: TextStyles.mediumTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        miniVerticalSpacer,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(const CitiesRoute());
                            },
                            child: Container(
                              width: 85,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.whiteDarkColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Go Now",
                                  style: TextStyles.smallTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greenDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      width: MediaQuery.of(context).size.width * .35,
                      'assets/svg/locations.svg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}