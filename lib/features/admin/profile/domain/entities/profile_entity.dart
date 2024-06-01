import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String gender;
  final String cin;
  final String phone;
  String? image;

  ProfileEntity({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    required this.cin,
    required this.phone,
    this.image,
  });

  @override
  List<Object> get props => [];
}
