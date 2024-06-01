part of 'bloc.dart';

@immutable
abstract class DriverState {
  const DriverState();
}

class DriverInitial extends DriverState {}

class GetDriversLoading extends DriverState {}

class GetDriversSuccess extends DriverState {
  final List<DriverModel> drivers;
  const GetDriversSuccess({
    required this.drivers,
  });
}

class GetDriversFailed extends DriverState {
  final String message;

  const GetDriversFailed({
    required this.message,
  });
}

class AddDriverLoading extends DriverState {}

class AddDriverSuccess extends DriverState {}

class AddDriverFailed extends DriverState {
  final String message;

  const AddDriverFailed({
    required this.message,
  });
}

class UpdateDriverLoading extends DriverState {}

class UpdateDriverSuccess extends DriverState {}

class UpdateDriverFailed extends DriverState {
  final String message;

  const UpdateDriverFailed({
    required this.message,
  });
}

class DeleteDriverLoading extends DriverState {}

class DeleteDriverSuccess extends DriverState {}

class DeleteDriverFailed extends DriverState {
  final String message;

  const DeleteDriverFailed({
    required this.message,
  });
}
