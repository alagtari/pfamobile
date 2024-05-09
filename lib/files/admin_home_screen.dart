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
                        miniVerticalSpacer,
                        Text(
                          "Take control of your truck management .",
                          style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        extraSmallVerticalSpacer,
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
                        miniVerticalSpacer,
                        Text(
                          "Take charge of your driver management .",
                          style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        extraSmallVerticalSpacer,
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
                        miniVerticalSpacer,
                        Text(
                          "Seamlessly organize your schedules .",
                          style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        extraSmallVerticalSpacer,
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
                        miniVerticalSpacer,
                        Text(
                          "Create & mange the cities and locations .",
                          style: TextStyles.smallTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        ),
                        extraSmallVerticalSpacer,
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
