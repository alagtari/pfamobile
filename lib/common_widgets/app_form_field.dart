import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/text_styles.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final bool? obscured;
  final void Function(String?)? onSubmitted;
  final TextEditingController controller;

  const AppFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscured = false,
    this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.all(
          CustomRaius.smallRadius,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscured!,
          onTap: () {},
          style: TextStyles.mediumTextStyle.copyWith(
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,

            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: AppColors.greyDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
