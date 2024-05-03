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
class UpdateLocationScreen extends StatefulWidget {
  const UpdateLocationScreen({
    super.key,
  });

  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
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
              title: "Address",
            ),
            largeVerticalSpacer,
            extraMiniVerticalSpacer,
            AppFormField(
              hintText: "State",
              controller: _emailController,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              hintText: "Municipality",
              controller: _emailController,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              hintText: "City",
              controller: _emailController,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              hintText: "Street",
              controller: _emailController,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              hintText: "Postal Code",
              controller: _emailController,
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDarkColor,
                size: 20,
              ),
            ),
            const Expanded(child: SizedBox()),
            AppBotton(
              bottonText: "Change",
              onClick: () {},
            ),
            miniVerticalSpacer,
          ],
        ),
      ),
    );
  }
}
