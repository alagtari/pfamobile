import 'package:equatable/equatable.dart';

class CitizenPlanEntity extends Equatable {
  final String? id;
  final DateTime date;
  final DateTime startHour;
  final DateTime endHour;
  final String garbageType;


  const CitizenPlanEntity({
    this.id,
    required this.date,
    required this.startHour,
    required this.endHour,
    required this.garbageType,
  });

  @override
  List<Object> get props => [];
}
