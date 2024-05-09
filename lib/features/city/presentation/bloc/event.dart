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

class UpdateCityEvent extends CityEvent {
  final CityModel city;
  final String id;

  const UpdateCityEvent({
    required this.city,
    required this.id,
  });
}

class GetCitiesEvent extends CityEvent {}

class DeleteCityEvent extends CityEvent {
  final String id;
  const DeleteCityEvent({
    required this.id,
  });
}
