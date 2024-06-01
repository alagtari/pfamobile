import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';

class CityEntity extends Equatable {
  final String? id;
  final String name;
  final String postalCode;
  final String state;
  final LocationModel cityLocation;
  List<LocationModel>? locations;

  CityEntity({
    required this.state,
    required this.cityLocation,
    this.id,
    required this.name,
    required this.postalCode,
    this.locations,
  });

  @override
  List<Object> get props => [];
}
