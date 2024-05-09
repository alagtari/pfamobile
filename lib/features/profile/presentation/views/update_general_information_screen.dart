import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/common_widgets/app_date_picker.dart';
import 'package:mobile/common_widgets/app_dropdown_widget.dart';
import 'package:mobile/common_widgets/app_form_field.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/features/profile/data/models/profile_model.dart';
import 'package:mobile/features/profile/presentation/bloc/bloc.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/radius.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class UpdateGeneralInformationScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const UpdateGeneralInformationScreen({
    super.key,
  });

  @override
  State<UpdateGeneralInformationScreen> createState() =>
      _UpdateGeneralInformationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ProfileBloc()..add(ViewProfileEvent()),
        child: this,
      );
}

class _UpdateGeneralInformationScreenState
    extends State<UpdateGeneralInformationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cinController = TextEditingController();

  late XFile? imageFile = null;
  late String? imageUrl = null;
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

  void _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your first name.';
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = 'First name must be at least 3 characters long.';
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
        errorMessage.value = 'Please enter your last name.';
        valid = false;
      });
    } else if (value.length < 3) {
      setState(() {
        errorMessage.value = 'Last name must be at least 3 characters long.';
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateCin(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your CIN.';
        valid = false;
      });
    } else if (value.length != 8) {
      setState(() {
        errorMessage.value = 'CIN must be exactly 8 digits long.';
        valid = false;
      });
    } else if (value[0] != '0' && value[0] != '1') {
      setState(() {
        errorMessage.value = 'CIN must start with 0 or 1.';
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = 'Please enter your phone number.';
        valid = false;
      });
    } else if (value.length != 8) {
      setState(() {
        errorMessage.value = 'Phone number must be exactly 8 digits long.';
        valid = false;
      });
    } else if (!['2', '3', '4', '5', '7', '9'].contains(value[0])) {
      setState(() {
        errorMessage.value = "This phone number isn't a tunisian number.";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    errorMessage = ValueNotifier("");
    valid = true;
    _gender = ValueNotifier<String?>(null);
    _date = ValueNotifier<DateTime?>(null);
  }

  void _onSubmit() {
    _validateFirstName(_firstNameController.text);
    if (!valid) return;
    _validateLastName(_lastNameController.text);
    if (!valid) return;
    if (_date.value == null) {
      setState(() {
        errorMessage.value = 'Birth date is required.';
      });
      return;
    }
    if (_gender.value == null) {
      setState(() {
        errorMessage.value = 'Gender is required.';
      });
      return;
    }
    _validateCin(_cinController.text);
    if (!valid) return;
    _validatePhone(_phoneController.text);
    if (!valid) return;

    final profile = ProfileModel(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      birthDate: _date.value!,
      gender: _gender.value!,
      cin: _cinController.text,
      phone: _phoneController.text,
      image: imageFile?.path,
    );
    context.read<ProfileBloc>().add(
          UpdateProfileEvent(
            request: profile,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          context.router.back();
        }
        if (state is ViewProfileSuccess) {
          setState(() {
            _firstNameController.text = state.profile.firstName;
            _lastNameController.text = state.profile.lastName;
            _phoneController.text = state.profile.phone;
            _cinController.text = state.profile.cin;
            _date.value = state.profile.birthDate;
            _gender.value = state.profile.gender;
            imageUrl = state.profile.image;
          });
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
                title: "General information",
              ),
              largeVerticalSpacer,
              Expanded(
                child: SingleChildScrollView(
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
                                height:
                                    MediaQuery.of(context).size.height * .22,
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
                            : imageUrl != null
                                ? Container(
                                    width: MediaQuery.of(context).size.height *
                                        .22,
                                    height: MediaQuery.of(context).size.height *
                                        .22,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          "${dotenv.env['IMAGE_BASE_URL']}/${imageUrl!}",
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
                                      width:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: AppColors.greyLightColor,
                                        borderRadius: BorderRadius.all(
                                          CustomRaius.smallRadius,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.file_upload_outlined,
                                            color: AppColors.greyDarkColor,
                                            size: 30,
                                          ),
                                          smallVerticalSpacer,
                                          Text(
                                            "click here to select profile picture",
                                            style: TextStyles.mediumTextStyle
                                                .copyWith(
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
                        hintText: "First Name",
                        controller: _firstNameController,
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          color: AppColors.greyDarkColor,
                          size: 20,
                        ),
                      ),
                      extraSmallVerticalSpacer,
                      AppFormField(
                        hintText: "Last Name",
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
                            hint: "Birth date",
                            initialDate: value,
                          );
                        },
                      ),
                      extraSmallVerticalSpacer,
                      ValueListenableBuilder(
                          valueListenable: _gender,
                          builder: (context, value, child) {
                            log(value ?? "");
                            return AppDropdownWidget(
                              items: _genderItems,
                              onChange: changeGender,
                              hint: 'Gender',
                              icon: Icons.male_rounded,
                              initialValue: value,
                            );
                          }),
                      extraSmallVerticalSpacer,
                      AppFormField(
                        hintText: "Phone Number",
                        controller: _phoneController,
                        prefixIcon: const Icon(
                          Icons.local_phone_outlined,
                          color: AppColors.greyDarkColor,
                          size: 20,
                        ),
                      ),
                      extraSmallVerticalSpacer,
                      AppFormField(
                        hintText: "Identity Number",
                        controller: _cinController,
                        prefixIcon: const Icon(
                          Icons.perm_identity,
                          color: AppColors.greyDarkColor,
                          size: 20,
                        ),
                      ),
                      extraMiniVerticalSpacer,
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
                      largeVerticalSpacer,
                      AppBotton(
                        bottonText: "Change",
                        onClick: _onSubmit,
                      ),
                    ],
                  ),
                ),
              ),
              miniVerticalSpacer
            ],
          ),
        ),
      ),
    );
  }
}
