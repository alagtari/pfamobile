import 'package:mobile/features/admin/city/domain/entities/add_location_entity.dart';

class AddLocationModel extends AddLocationEntity {
  const AddLocationModel({
    required super.longitude,
    required super.latitude,
    required super.cityId,
  });

  factory AddLocationModel.fromJson(Map<String, dynamic> json) {
    return AddLocationModel(
      longitude: json['longitude'],
      latitude: json['latitude'],
      cityId: json['cityId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'cityId': cityId,
    };
  }
}
