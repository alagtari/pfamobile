import 'package:equatable/equatable.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';

class DriverEntity extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String cin;
  final String? image;
  final TruckModel? truck;

  const DriverEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cin,
    this.image,
    this.truck,
  });

  @override
  List<Object> get props => [];
}
