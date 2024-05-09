import 'package:mobile/features/driver/data/models/driver_model.dart';
import 'package:mobile/features/truck/domain/entities/truck_entity.dart';

class TruckModel extends TruckEntity {
  TruckModel({
    super.id,
    required super.number,
    required super.capacity,
    required super.model,
    super.driver,
  });

  factory TruckModel.fromJson(Map<String, dynamic> json) {
    return TruckModel(
      id: json["_id"],
      number: json['number'],
      capacity: json['capacity'],
      model: json['model'],
      driver:json['driver'] != null ? DriverModel.fromJson(json['driver']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'capacity': capacity,
      'model': model,
      'driver': driver?.id,
    };
  }
  TruckModel copyWith({
    String? number,
    String? model,
    DriverModel? driver,
    int? capacity,
  }) {
    return TruckModel(
      id: id,
      number: number ?? this.number,
      capacity: capacity ?? this.capacity,
      driver: driver ?? this.driver,
      model: model ?? this.model,
    );
  }
}
