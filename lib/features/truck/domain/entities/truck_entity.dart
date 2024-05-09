import 'package:equatable/equatable.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';

class TruckEntity extends Equatable {
  String? id;
  final String number;
  final int capacity;
  final String model;
  DriverModel? driver;

  TruckEntity({
    this.id,
    required this.number,
    required this.capacity,
    required this.model,
    this.driver,
  });

  @override
  List<Object> get props => [];
}
