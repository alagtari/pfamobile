part of 'bloc.dart';

@immutable
abstract class TruckEvent {
  const TruckEvent();
}

class AddTruckEvent extends TruckEvent {
  final TruckModel truck;
  const AddTruckEvent({
    required this.truck,
  });
}

class UpdateTruckEvent extends TruckEvent {
  final TruckModel truck;
  final String id;

  const UpdateTruckEvent({
    required this.truck,
    required this.id,
  });
}

class GetTrucksEvent extends TruckEvent {}
class GetAvailableDriversEvent extends TruckEvent {}

class DeleteTruckEvent extends TruckEvent {
  final String id;
  const DeleteTruckEvent({
    required this.id,
  });
}
