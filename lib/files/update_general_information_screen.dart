import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class UpdateGeneralInformationScreen extends StatefulWidget {
  const UpdateGeneralInformationScreen({
    super.key,
  });

  @override
  State<UpdateGeneralInformationScreen> createState() =>
      _UpdateGeneralInformationScreenState();
}

class _UpdateGeneralInformationScreenState
    extends State<UpdateGeneralInformationScreen> {
  final TextEditingController _emailController = TextEditingController();
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
            const ScreenTitle(
              title: "General information",
            ),
            largeVerticalSpacer,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    extraMiniVerticalSpacer,
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      dashPattern: const [7, 4],
                      strokeWidth: 1.5,
                      child: Container(
                        width: MediaQuery.of(context).size.height * .22,
                        height: MediaQuery.of(context).size.height * .22,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.greyLightColor,
                          borderRadius: BorderRadius.all(
                            CustomRaius.smallRadius,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.file_upload_outlined,
                              color: AppColors.greyDarkColor,
                              size: 30,
                            ),
                            smallVerticalSpacer,
                            Text(
                              "click here to select profile picture",
                              style: TextStyles.mediumTextStyle.copyWith(
                                color: AppColors.greyDarkColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    extraLargeVerticalSpacer,
                    AppFormField(
                      hintText: "First Name",
                      controller: _emailController,
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                    extraSmallVerticalSpacer,
                    AppFormField(
                      hintText: "Last Name",
                      controller: _emailController,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                    extraSmallVerticalSpacer,
                    AppFormField(
                      hintText: "Birth date",
                      controller: _emailController,
                      prefixIcon: const Icon(
                        Icons.calendar_month_rounded,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                    extraSmallVerticalSpacer,
                    AppFormField(
                      hintText: "Gender",
                      controller: _emailController,
                      prefixIcon: const Icon(
                        Icons.male_rounded,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                    extraSmallVerticalSpacer,
                    AppFormField(
                      hintText: "Phone Number",
                      controller: _emailController,
                      prefixIcon: const Icon(
                        Icons.local_phone_outlined,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                    extraSmallVerticalSpacer,
                    AppFormField(
                      hintText: "Identity Number",
                      controller: _emailController,
                      prefixIcon: const Icon(
                        Icons.perm_identity,
                        color: AppColors.greyDarkColor,
                        size: 20,
                      ),
                    ),
                    largeVerticalSpacer,
                    AppBotton(
                      bottonText: "Change",
                      onClick: () {},
                    ),
                  ],
                ),
              ),
            ),
            miniVerticalSpacer
          ],
        ),
      ),
    );
  }
}
