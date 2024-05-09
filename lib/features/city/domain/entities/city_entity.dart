import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String? id;
  final String name;
  final String postalCode;
  List<dynamic>? locations;

  CityEntity({
    this.id,
    required this.name,
    required this.postalCode,
    this.locations,
  });

  @override
  List<Object> get props => [];
}
