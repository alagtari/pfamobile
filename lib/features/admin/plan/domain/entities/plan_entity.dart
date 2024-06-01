import 'package:equatable/equatable.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';

class PlanEntity extends Equatable {
  final String? id;
  final DateTime date;
  final DateTime startHour;
  final DateTime endHour;
  final CityModel city;
  final TruckModel truck;
  final String garbageType;
  final List<LocationModel>? visitedLocation;

  const PlanEntity({
    this.id,
    required this.visitedLocation,
    required this.date,
    required this.startHour,
    required this.endHour,
    required this.city,
    required this.truck,
    required this.garbageType,
  });

  @override
  List<Object> get props => [];
}
