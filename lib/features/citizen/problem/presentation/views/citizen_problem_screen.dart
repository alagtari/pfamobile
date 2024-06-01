import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_textarea.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/citizen/problem/data/models/problem_model.dart';
import 'package:mobile/features/citizen/problem/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class CitizenProblemScreen extends StatefulWidget implements AutoRouteWrapper {
  const CitizenProblemScreen({
    super.key,
  });

  @override
  State<CitizenProblemScreen> createState() => _CitizenProblemScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => ProblemBloc(),
        child: this,
      );
}

class _CitizenProblemScreenState extends State<CitizenProblemScreen> {
  final TextEditingController controller = TextEditingController();
  late XFile? imageFile = null;
  late ValueNotifier<String> errorMessage;
  late bool valid;

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedImageFile;
  }

  void _validateText(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = "Decription text is required";
        valid = false;
      });
    } else if (value.length < 10) {
      setState(() {
        errorMessage.value = "Decription text must be at least 10 characters";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _onSubmit() {
    _validateText(controller.text);
    if (!valid) return;

    final incident = ProblemModel(
      content: controller.text,
      image: imageFile?.path,
    );
    context.read<ProblemBloc>().add(AddProblemEvent(incident: incident));
  }

  @override
  void initState() {
    errorMessage = ValueNotifier<String>('');
    valid = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProblemBloc, ProblemState>(
      listener: (context, state) {
        if (state is AddProblemSuccess) {
          context.router.replace(const CitizenHomeRoute());
        }
      },
      child: SafeArea(
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
              GestureDetector(
                onTap: () async {
                  XFile? image = await pickImage();
                  setState(() {
                    imageFile = image;
                  });
                },
                child: imageFile != null
                    ? Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .22,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(
                              File(imageFile!.path),
                            ), // Use FileImage constructor
                          ),
                          borderRadius: const BorderRadius.all(
                            CustomRaius.smallRadius,
                          ),
                        ),
                      )
                    : DottedBorder(
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
              ),
              extraSmallVerticalSpacer,
              Align(
                alignment: Alignment.centerLeft,
                child: ValueListenableBuilder(
                  valueListenable: errorMessage,
                  builder: (context, value, child) {
                    return Text(
                      errorMessage.value,
                      style: TextStyles.extraSmallTextStyle.copyWith(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
              AppBotton(
                bottonText: "Report",
                onClick: _onSubmit,
              ),
              miniVerticalSpacer,
            ],
          ),
        ),
      ),
    );
  }
}
