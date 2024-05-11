import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/text_styles.dart';

class AppDropdownWidget extends StatefulWidget {
  const AppDropdownWidget({
    super.key,
    required this.items,
    required this.onChange,
    required this.hint,
    required this.icon,
    this.initialValue,
  });
  final List<DropdownMenuItem> items;
  final void Function(String) onChange;
  final String hint;
  final IconData icon;
  final String? initialValue;

  @override
  State<AppDropdownWidget> createState() => _AppDropdownWidgetState();
}

class _AppDropdownWidgetState extends State<AppDropdownWidget> {
  late ValueNotifier<String?> selectedItem;

  @override
  void initState() {
    selectedItem = ValueNotifier<String?>(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.all(
          CustomRaius.smallRadius,
        ),
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: AppColors.greyDarkColor,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          ValueListenableBuilder(
            valueListenable: selectedItem,
            builder: (context, item, child) {
              return Expanded(
                child: DropdownButton(
                  hint: Text(
                    widget.hint,
                    style: TextStyles.mediumTextStyle.copyWith(
                      color: AppColors.greyDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: item ?? widget.initialValue,
                  items: widget.items,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.greyDarkColor,
                  ),
                  underline: Container(),
                  onChanged: (value) {
                    setState(() {
                      selectedItem.value = value;
                    });
                    widget.onChange(value);
                  },
                  isExpanded: true,
                  style: TextStyles.mediumTextStyle.copyWith(
                    color: AppColors.greyDarkColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
