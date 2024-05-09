import 'package:mobile/features/city/data/models/city_model.dart';
import 'package:mobile/features/plan/domain/entities/plan_entity.dart';
import 'package:mobile/features/truck/data/models/truck_model.dart';

class PlanModel extends PlanEntity {
  const PlanModel({
    String? id,
    required DateTime date,
    required DateTime startHour,
    required DateTime endHour,
    required CityModel city,
    required TruckModel truck,
    required String garbageType,
  }) : super(
          id: id,
          date: date,
          startHour: startHour,
          endHour: endHour,
          city: city,
          truck: truck,
          garbageType: garbageType,
        );

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json["_id"],
      date: DateTime.parse(json['date']),
      startHour: DateTime.parse(json['startHour']),
      endHour: DateTime.parse(json['endHour']),
      city: CityModel.fromJson(json['city']),
      truck: TruckModel.fromJson(json['truck']),
      garbageType: json['garbageType'],
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
