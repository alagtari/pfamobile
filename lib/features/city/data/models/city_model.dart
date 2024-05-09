import 'package:mobile/features/city/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    super.id,
    required super.name,
    required super.postalCode,
    super.locations,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json["_id"],
      name: json['name'],
      postalCode: json['postalCode'],
      locations: json['locations'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'postalCode': postalCode,
      'locations': locations,
    };
  }

  CityModel copyWith({
    String? name,
    String? postalCode,
  }) {
    return CityModel(
      id: id,
      name: name ?? this.name,
      postalCode: postalCode ?? this.postalCode,
      locations: locations,
    );
  }
}
