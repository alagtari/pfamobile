import 'package:latlong2/latlong.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/city/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    super.id,
    required super.name,
    required super.postalCode,
    super.locations,
    required super.state,
    required super.cityLocation,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    final List<LocationModel> locations = [];
    for (var location in json['locations'] as List) {
      locations.add(LocationModel.fromJson(location));
    }
    return CityModel(
      id: json["_id"],
      name: json['name'],
      postalCode: json['postalCode'],
      locations: locations,
      state: json['state'],
      cityLocation: LocationModel.fromJson(json['cityLocation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'postalCode': postalCode,
      'state': state,
      'cityLocation': cityLocation.toJson(),
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
      state: '',
      cityLocation: cityLocation,
    );
  }
}
