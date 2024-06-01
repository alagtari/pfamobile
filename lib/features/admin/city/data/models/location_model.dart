import 'package:latlong2/latlong.dart';
import 'package:mobile/features/admin/city/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    super.id,
    required super.longitude,
    required super.latitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['_id'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  factory LocationModel.fromLatLng(LatLng latLng) {
    return LocationModel(
      longitude: latLng.longitude,
      latitude: latLng.latitude,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}
