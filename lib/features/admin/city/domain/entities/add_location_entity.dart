import 'package:equatable/equatable.dart';

class AddLocationEntity extends Equatable {
  final double longitude;
  final double latitude;
  final String cityId;

  const AddLocationEntity({
    required this.longitude,
    required this.latitude,
    required this.cityId,
  });

  @override
  List<Object> get props => [];
}
