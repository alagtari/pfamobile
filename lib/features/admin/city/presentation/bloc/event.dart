part of 'bloc.dart';

@immutable
abstract class CityEvent {
  const CityEvent();
}

class AddCityEvent extends CityEvent {
  final CityModel city;
  const AddCityEvent({
    required this.city,
  });
}

class VerifyCityEvent extends CityEvent {
  final String name;
  final String state;
  const VerifyCityEvent({
    required this.name,
    required this.state,
  });
}

class UpdateCityEvent extends CityEvent {
  final CityModel city;
  final String id;

  const UpdateCityEvent({
    required this.city,
    required this.id,
  });
}

class GetCitiesEvent extends CityEvent {}

class GetCitiesForCitizenEvent extends CityEvent {}

class DeleteCityEvent extends CityEvent {
  final String id;
  const DeleteCityEvent({
    required this.id,
  });
}

class AddCityLocationEvent extends CityEvent {
  final AddLocationModel location;
  const AddCityLocationEvent({
    required this.location,
  });
}

class DeleteCityLocationEvent extends CityEvent {
  final String id;
  const DeleteCityLocationEvent({
    required this.id,
  });
}