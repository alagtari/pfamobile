part of 'bloc.dart';

@immutable
abstract class TruckState {
  const TruckState();
}

class TruckInitial extends TruckState {}

class GetTrucksLoading extends TruckState {}

class GetTrucksSuccess extends TruckState {
  final List<TruckModel> trucks;
  const GetTrucksSuccess({
    required this.trucks,
  });
}

class GetTrucksFailed extends TruckState {
  final String message;

  const GetTrucksFailed({
    required this.message,
  });
}

class GetAvailableDriversLoading extends TruckState {}

class GetAvailableDriversSuccess extends TruckState {
  final List<DriverModel> drivers;
  const GetAvailableDriversSuccess({
    required this.drivers,
  });
}

class GetAvailableDriversFailed extends TruckState {
  final String message;

  const GetAvailableDriversFailed({
    required this.message,
  });
}

class AddTruckLoading extends TruckState {}

class AddTruckSuccess extends TruckState {}

class AddTruckFailed extends TruckState {
  final String message;

  const AddTruckFailed({
    required this.message,
  });
}

class UpdateTruckLoading extends TruckState {}

class UpdateTruckSuccess extends TruckState {}

class UpdateTruckFailed extends TruckState {
  final String message;

  const UpdateTruckFailed({
    required this.message,
  });
}

class DeleteTruckLoading extends TruckState {}

class DeleteTruckSuccess extends TruckState {}

class DeleteTruckFailed extends TruckState {
  final String message;

  const DeleteTruckFailed({
    required this.message,
  });
}
