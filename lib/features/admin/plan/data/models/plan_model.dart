import 'package:mobile/core/enums/mission_enum.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/plan/domain/entities/plan_entity.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';

class PlanModel extends PlanEntity {
  const PlanModel({
    super.id,
    required super.date,
    required super.startHour,
    required super.endHour,
    required super.city,
    required super.truck,
    required super.garbageType,
    super.visitedLocation,
    required super.status
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    final List<LocationModel> locations = [];
    for (var location in json['visitedLocation'] as List) {
      locations.add(LocationModel.fromJson(location));
    }
    return PlanModel(
      id: json["_id"],
      date: DateTime.parse(json['date']),
      startHour: DateTime.parse(json['startHour']),
      endHour: DateTime.parse(json['endHour']),
      city: CityModel.fromJson(json['city']),
      truck: TruckModel.fromJson(json['truck']),
      garbageType: json['garbageType'],
      visitedLocation: locations,
      status: getMissionStatusFromString(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'date': date.toIso8601String(),
      'startHour': startHour.toIso8601String(),
      'endHour': endHour.toIso8601String(),
      'city': city.id,
      'truck': truck.id,
      'garbageType': garbageType,
    };
  }
}
