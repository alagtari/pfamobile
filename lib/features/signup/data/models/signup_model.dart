import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:mobile/features/signup/domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel({
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required super.gender,
    required super.image,
    required super.phone,
    required super.cin,
    required super.email,
    required super.password,
    required super.city,
    required super.street,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
      image: json['image'],
      phone: json['phone'],
      cin: json['cin'],
      email: json['email'],
      password: json['password'], // Add password field
      city: json['city'],
      street: json['street'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'gender': gender,
      'image': image,
      'phone': phone,
      'cin': cin,
      'email': email,
      'password': password,
      'city': city,
      'street': street,
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
        'email': email,
        'password': password, // Add password field
        'city': city,
        'street': street,
      },
    );
  }
}
