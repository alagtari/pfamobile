import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String? id;
  final double longitude;
  final double latitude;

  const LocationEntity({
    this.id,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object> get props => [latitude, longitude];
}
