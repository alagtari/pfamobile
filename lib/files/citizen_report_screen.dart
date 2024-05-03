import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_textarea.dart';
import 'package:mobile/files/category_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class CitizenReportScreen extends StatefulWidget {
  const CitizenReportScreen({
    super.key,
  });

  @override
  State<CitizenReportScreen> createState() => _CitizenReportScreenState();
}

class _CitizenReportScreenState extends State<CitizenReportScreen> {
  final TextEditingController controller = TextEditingController();
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
              title: "Report Problem",
              arrowBack: false,
            ),
            largeVerticalSpacer,
            Text(
              "We will help you as soon as you describe the problem in the paragraphs below.",
              style: TextStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            largeVerticalSpacer,
            AppTextarea(
              hintText: "Here you can describe the problem in more detail",
              controller: controller,
            ),
            largeVerticalSpacer,
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(15),
              dashPattern: const [7, 4],
              strokeWidth: 1.5,
              child: Container(
                width: double.infinity,
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
                      size: 40,
                    ),
                    miniVerticalSpacer,
                    Text(
                      "click to select image here",
                      style: TextStyles.mediumTextStyle.copyWith(
                        color: AppColors.greyDarkColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    extraMiniVerticalSpacer,
                    Text(
                      "JPG or PNG file size no more than 10 MB",
                      style: TextStyles.smallTextStyle.copyWith(
                        color: AppColors.greyDarkColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            const AppBotton(bottonText: "Report"),
            miniVerticalSpacer,
          ],
        ),
      ),
    );
  }
}
