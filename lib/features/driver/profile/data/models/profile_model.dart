import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:mobile/features/admin/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required super.gender,
    required super.cin,
    required super.phone,
    super.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
      cin: json['cin'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'gender': gender,
      'cin': cin,
      'phone': phone,
      'image': image,
    };
  }

  Future<FormData> toFormData() async {
    final fileName = image?.split(Platform.pathSeparator).last;
    final mimeType = lookupMimeType(fileName ?? "");

    return FormData.fromMap(
      {
        'firstName': firstName,
        'lastName': lastName,
        'birthDate': birthDate.toIso8601String(),
        'gender': gender,
        'cin': cin,
        'phone': phone,
        "image": (image != null)
            ? await MultipartFile.fromFile(
                image!,
                filename: fileName,
                contentType:
                    (mimeType != null) ? MediaType.parse(mimeType) : null,
              )
            : null,
      },
    );
  }
}
