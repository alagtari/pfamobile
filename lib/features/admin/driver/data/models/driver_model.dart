import 'package:mobile/features/admin/driver/domain/entities/driver_entity.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';

class DriverModel extends DriverEntity {
  const DriverModel({
    super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.cin,
    super.image,
    super.truck,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      cin: json['cin'],
      image: json['image'],
      truck: json['truck'] != null ? TruckModel.fromJson(json['truck']) : null,
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'cin': cin,
      'image': image,
      'role': 'driver',
      "_id": id
    };
  }

  DriverModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? cin,
    String? image,
  }) {
    return DriverModel(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cin: cin ?? this.cin,
      image: image ?? this.image,
    );
  }
}
