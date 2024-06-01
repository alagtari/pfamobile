import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/citizen/calendar/domain/entities/citizen_plan_entity.dart';

class CitizenPlanModel extends CitizenPlanEntity {
  const CitizenPlanModel({
    super.id,
    required super.date,
    required super.startHour,
    required super.endHour,
    required super.garbageType,
  });

  factory CitizenPlanModel.fromJson(Map<String, dynamic> json) {
    final List<LocationModel> locations = [];
    for (var location in json['visitedLocation'] as List) {
      locations.add(LocationModel.fromJson(location));
    }
    return CitizenPlanModel(
      id: json["_id"],
      date: DateTime.parse(json['date']),
      startHour: DateTime.parse(json['startHour']),
      endHour: DateTime.parse(json['endHour']),
      garbageType: json['garbageType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'date': date.toIso8601String(),
      'startHour': startHour.toIso8601String(),
      'endHour': endHour.toIso8601String(),
      'garbageType': garbageType,
    };
  }
}
