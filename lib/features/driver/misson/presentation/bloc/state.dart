part of 'bloc.dart';

@immutable
abstract class MissionState {
  const MissionState();
}

class MissionInitial extends MissionState {}

class GetMissionsLoading extends MissionState {}

class GetMissionsSuccess extends MissionState {
  final List<MissionModel> missons;
  const GetMissionsSuccess({
    required this.missons,
  });
}

class GetMissionsFailed extends MissionState {
  final String message;

  const GetMissionsFailed({
    required this.message,
  });
}

class GeolocationLoading extends MissionState {}

class GeolocationLoaded extends MissionState {
  final Position position;

  const GeolocationLoaded(this.position);
}

class GeolocationError extends MissionState {
  final String message;

  const GeolocationError(this.message);
}

class GetLocationsLoading extends MissionState {}

class GetLocationsSuccess extends MissionState {
  final List<LatLng> locations;
  const GetLocationsSuccess({
    required this.locations,
  });
}

class GetLocationsFailed extends MissionState {
  final String message;

  const GetLocationsFailed({
    required this.message,
  });
}

class StartMissonLoading extends MissionState {}

class StartMissonSuccess extends MissionState {}

class StartMissonFailed extends MissionState {
  final String message;
  const StartMissonFailed({
    required this.message,
  });
}

class EndMissonLoading extends MissionState {}

class EndMissonSuccess extends MissionState {}

class EndMissonFailed extends MissionState {
  final String message;
  const EndMissonFailed({
    required this.message,
  });
}

class VisitLocationLoading extends MissionState {}

class VisitLocationSuccess extends MissionState {}

class VisitLocationFailed extends MissionState {
  final String message;
  const VisitLocationFailed({
    required this.message,
  });
}
