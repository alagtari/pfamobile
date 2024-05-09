import 'package:equatable/equatable.dart';

class DriverEntity extends Equatable {
  String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String cin;
  String? image;

  DriverEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cin,
    this.image,
  });

  @override
  List<Object> get props => [];
}
