import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/driver/misson/domain/repositories/misson_repository.dart';
import 'package:mobile/features/driver/misson/data/models/misson_model.dart';
part 'event.dart';
part 'state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  final _repo = sl<MissionRepository>();

  MissionBloc() : super(MissionInitial()) {
    on<MissionEvent>((event, emit) {});

    on<GetLocationEvent>((event, emit) async {
      emit(GeolocationLoading());

      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return emit(const GeolocationError('Location services are disabled.'));
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return emit(
              const GeolocationError('Location permissions are denied.'));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return emit(const GeolocationError(
            'Location permissions are permanently denied, we cannot request permissions.'));
      }

      final position = await Geolocator.getCurrentPosition();
      emit(GeolocationLoaded(position));
    });
    on<GetLocationsEvent>(
      (event, emit) async {
        emit(GetLocationsLoading());
        final res = await _repo.getDirections(event.start, event.end);
        res.fold(
          (l) => emit(GetLocationsFailed(message: l.message)),
          (r) => emit(GetLocationsSuccess(locations: r)),
        );
      },
    );

    on<StartMissonEvent>(
      (event, emit) async {
        emit(StartMissonLoading());
        final res = await _repo.startMission(event.id);
        res.fold(
          (l) => emit(StartMissonFailed(message: l.message)),
          (r) => emit(StartMissonSuccess()),
        );
      },
    );
    on<EndMissonEvent>(
      (event, emit) async {
        emit(EndMissonLoading());
        final res = await _repo.endMission(event.id);
        res.fold(
          (l) => emit(EndMissonFailed(message: l.message)),
          (r) => emit(EndMissonSuccess()),
        );
      },
    );
    on<VisitLocationEvent>(
      (event, emit) async {
        emit(VisitLocationLoading());
        final res = await _repo.visitLocation(event.locationId, event.planId);
        res.fold(
          (l) => emit(VisitLocationFailed(message: l.message)),
          (r) => emit(VisitLocationSuccess()),
        );
      },
    );
  }
}
