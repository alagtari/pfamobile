part of 'bloc.dart';

@immutable
abstract class DriverEvent {
  const DriverEvent();
}

class AddDriverEvent extends DriverEvent {
  final DriverModel driver;
  const AddDriverEvent({
    required this.driver,
  });
}

class UpdateDriverEvent extends DriverEvent {
  final DriverModel driver;
  final String id;

  const UpdateDriverEvent({
    required this.driver,
    required this.id,
  });
}

class GetDriversEvent extends DriverEvent {}

class DeleteDriverEvent extends DriverEvent {
  final String id;
  const DeleteDriverEvent({
    required this.id,
  });
}
