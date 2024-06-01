part of 'bloc.dart';

@immutable
abstract class CityState {
  const CityState();
}

class CityInitial extends CityState {}

class GetCitiesLoading extends CityState {}

class GetCitiesSuccess extends CityState {
  final List<CityModel> cities;
  const GetCitiesSuccess({
    required this.cities,
  });
}

class GetCitiesFailed extends CityState {
  final String message;

  const GetCitiesFailed({
    required this.message,
  });
}

class AddCityLoading extends CityState {}

class AddCitySuccess extends CityState {}

class AddCityFailed extends CityState {
  final String message;

  const AddCityFailed({
    required this.message,
  });
}

class VerifyCityLoading extends CityState {}

class VerifyCitySuccess extends CityState {
  final LatLng location;

  const VerifyCitySuccess({
    required this.location,
  });
}

class VerifyCityFailed extends CityState {
  final String message;

  const VerifyCityFailed({
    required this.message,
  });
}

class UpdateCityLoading extends CityState {}

class UpdateCitySuccess extends CityState {}

class UpdateCityFailed extends CityState {
  final String message;

  const UpdateCityFailed({
    required this.message,
  });
}

class DeleteCityLoading extends CityState {}

class DeleteCitySuccess extends CityState {}

class DeleteCityFailed extends CityState {
  final String message;

  const DeleteCityFailed({
    required this.message,
  });
}

class AddCityLocationLoading extends CityState {}

class AddCityLocationSuccess extends CityState {
  final LocationModel location;

  const AddCityLocationSuccess({
    required this.location,
  });
}

class AddCityLocationFailed extends CityState {
  final String message;

  const AddCityLocationFailed({
    required this.message,
  });
}

class DeleteCityLocationLoading extends CityState {}

class DeleteCityLocationSuccess extends CityState {}

class DeleteCityLocationFailed extends CityState {
  final String message;

  const DeleteCityLocationFailed({
    required this.message,
  });
}