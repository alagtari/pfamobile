import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String gender;
  final String? image;
  final String phone;
  final String cin;
  final String email;
  final String password; // Add password field
  final String city;
  final String street;

  const SignupEntity({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    this.image,
    required this.phone,
    required this.cin,
    required this.email,
    required this.password,
    required this.city,
    required this.street,
  });

  @override
  List<Object> get props => [];
}
