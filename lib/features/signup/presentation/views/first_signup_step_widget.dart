import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_date_picker.dart';
import 'package:mobile/common_widgets/app_dropdown_widget.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

class FirstSignupStepWidget extends StatefulWidget {
  const FirstSignupStepWidget({
    super.key,
    required this.submit,
  });

  final Function(
    String firstName,
    String lastName,
    DateTime birthDate,
    String gender,
    String? image,
  ) submit;

  @override
  State<FirstSignupStepWidget> createState() => _FirstSignupStepWidgetState();
}

class _FirstSignupStepWidgetState extends State<FirstSignupStepWidget> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  late XFile? imageFile = null;
  late ValueNotifier<DateTime?> _date;

  late ValueNotifier<String> errorMessage;
  late bool valid;

  late ValueNotifier<String?> _gender;
  final List<DropdownMenuItem> _genderItems = const [
    DropdownMenuItem(
      value: 'male',
      child: Text(
        'Male',
        style: TextStyle(
          color: AppColors.greyDarkColor,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'female',
      child: Text(
        'Female',
        style: TextStyle(
          color: AppColors.greyDarkColor,
        ),
      ),
    ),
  ];

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedImageFile;
  }

  void onDateSelected(DateTime date) {
    setState(() {
      _date.value = date;
    });
  }

  void changeGender(String gender) {
    setState(() {
      _gender.value = gender;
    });
  }

  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;
    _gender = ValueNotifier<String?>(null);
    _date = ValueNotifier<DateTime?>(null);
  }

  void _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.first_name_prompt;
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = context.l10n.first_name_length_error;
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = context.l10n.last_name_prompt;
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = context.l10n.last_name_length_error;
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
    _validateFirstName(_firstNameController.text);
    if (!valid) return;
    _validateLastName(_lastNameController.text);
    if (!valid) return;
    if (_date.value == null) {
      setState(() {
        errorMessage.value = context.l10n.birth_date_required;
      });
      return;
    }
    if (_gender.value == null) {
      setState(() {
        errorMessage.value = context.l10n.gender_required;
      });
      return;
    }
    widget.submit(
      _firstNameController.text,
      _lastNameController.text,
      _date.value!,
      _gender.value!,
      imageFile?.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          extraMiniVerticalSpacer,
          GestureDetector(
            onTap: () async {
              XFile? image = await pickImage();
              setState(() {
                imageFile = image;
              });
            },
            child: imageFile != null
                ? Container(
                    width: MediaQuery.of(context).size.height * .22,
                    height: MediaQuery.of(context).size.height * .22,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: FileImage(
                          File(imageFile!.path),
                        ), // Use FileImage constructor
                      ),
                      borderRadius: const BorderRadius.all(
                        CustomRaius.mediumRadius,
                      ),
                    ),
                  )
                : DottedBorder(
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
                            context.l10n.click_to_select_profile_pic,
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
          ),
          extraLargeVerticalSpacer,
          AppFormField(
            hintText: context.l10n.first_name,
            controller: _firstNameController,
            prefixIcon: const Icon(
              Icons.person_2_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          AppFormField(
            hintText: context.l10n.last_name,
            controller: _lastNameController,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.greyDarkColor,
              size: 20,
            ),
          ),
          extraSmallVerticalSpacer,
          ValueListenableBuilder(
            valueListenable: _date,
            builder: (context, value, child) {
              return AppDatePickerField(
                onDateSelected: onDateSelected,
                hint: context.l10n.birth_date,
                initialDate: value,
              );
            },
          ),
          extraSmallVerticalSpacer,
          ValueListenableBuilder(
              valueListenable: _gender,
              builder: (context, value, child) {
                return AppDropdownWidget(
                  items: _genderItems,
                  onChange: changeGender,
                  hint: context.l10n.gender,
                  icon: Icons.male_rounded,
                  initialValue: value,
                );
              }),
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
          AppBotton(
            bottonText: context.l10n.continue_step,
            onClick: () {
              _onSubmit();
            },
          ),
        ],
      ),
    );
  }
}
