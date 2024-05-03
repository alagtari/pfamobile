import 'package:flutter/material.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class ThirdSignupStepWidget extends StatefulWidget {
  const ThirdSignupStepWidget({
    super.key,
    required TextEditingController emailController,
    required this.submit,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final VoidCallback submit;
  @override
  State<ThirdSignupStepWidget> createState() => _ThirdSignupStepWidgetState();
}

class _ThirdSignupStepWidgetState extends State<ThirdSignupStepWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AppFormField(
            hintText: "State",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "Municipality",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "City",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "Street",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: "Postal Code",
            controller: widget._emailController,
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          AppBotton(
            bottonText: "Finish",
            onClick: widget.submit,
          ),
        ],
      ),
    );
  }
}
