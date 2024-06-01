part of 'bloc.dart';

@immutable
abstract class MissionEvent {
  const MissionEvent();
}

class GetMissionsEvent extends MissionEvent {}

class GetLocationEvent extends MissionEvent {}

class GetLocationsEvent extends MissionEvent {
  final LatLng start;
  final LatLng end;
  const GetLocationsEvent({
    required this.start,
    required this.end,
  });
}

class StartMissonEvent extends MissionEvent {
  final String id;
  const StartMissonEvent({
    required this.id,
  });
}

class EndMissonEvent extends MissionEvent {
  final String id;
  const EndMissonEvent({
    required this.id,
  });
}

class VisitLocationEvent extends MissionEvent {
  final String locationId;
  final String planId;
  const VisitLocationEvent({
    required this.locationId,
    required this.planId,
  });
}
