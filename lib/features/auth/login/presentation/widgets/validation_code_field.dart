import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

class ValidationCodeField extends StatelessWidget {
  const ValidationCodeField({
    super.key,
    required this.controllers,
  });

  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.greyLightColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: MediaQuery.of(context).size.width * .125,
          height: MediaQuery.of(context).size.width * .125,
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (String value) {
              if (value.length == 1 && index < 5) {
                FocusScope.of(context).nextFocus();
              }
              if (index == 5 && value.length == 1) {}
            },
            style: TextStyles.largeTextStyle.copyWith(
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
          ),
        );
      }),
    );
  }
}
