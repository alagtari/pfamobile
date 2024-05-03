import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class FirstSignupStepWidget extends StatelessWidget {
  const FirstSignupStepWidget({
    super.key,
    required TextEditingController emailController,
    required this.submit,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(15),
            dashPattern: const [7, 4],
            strokeWidth: 1.5,
            child: Container(
              width: MediaQuery.of(context).size.height * .25,
              height: MediaQuery.of(context).size.height * .25,
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
          extraSmallVerticalSpacer,
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
          const Expanded(
            child: SizedBox(),
          ),
          AppBotton(
            bottonText: "Continue",
            onClick: submit,
          ),
        ],
      ),
    );
  }
}
