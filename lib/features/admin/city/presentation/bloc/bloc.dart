import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/city/data/models/add_location_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/city/domain/repositories/city_repository.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
part 'event.dart';
part 'state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final _repo = sl<CityRepository>();

  CityBloc() : super(CityInitial()) {
    on<CityEvent>((event, emit) {});
    on<GetCitiesEvent>(
      (event, emit) async {
        emit(GetCitiesLoading());
        final res = await _repo.getCities();
        res.fold(
          (l) => emit(GetCitiesFailed(message: l.message)),
          (r) => emit(GetCitiesSuccess(cities: r.payload!)),
        );
      },
    );

    on<GetCitiesForCitizenEvent>(
      (event, emit) async {
        emit(GetCitiesForCitizenLoading());
        final res = await _repo.getCitiesForCitizen();
        res.fold(
          (l) => emit(GetCitiesForCitizenFailed(message: l.message)),
          (r) => emit(GetCitiesForCitizenSuccess(cities: r.payload!)),
        );
      },
    );

    on<AddCityEvent>(
      (event, emit) async {
        emit(AddCityLoading());
        final res = await _repo.addCity(event.city);
        res.fold(
          (l) => emit(AddCityFailed(message: l.message)),
          (r) => emit(AddCitySuccess()),
        );
      },
    );
    on<VerifyCityEvent>(
      (event, emit) async {
        emit(VerifyCityLoading());
        final res =
            await _repo.verifyCity(state: event.state, name: event.name);
        res.fold(
          (l) => emit(VerifyCityFailed(message: l.message)),
          (r) => emit(VerifyCitySuccess(location: r!)),
        );
      },
    );
    on<UpdateCityEvent>(
      (event, emit) async {
        emit(UpdateCityLoading());
        final res = await _repo.updateCity(event.city, event.id);
        res.fold(
          (l) => emit(UpdateCityFailed(message: l.message)),
          (r) => emit(UpdateCitySuccess()),
        );
      },
    );
    on<DeleteCityEvent>(
      (event, emit) async {
        emit(DeleteCityLoading());
        final res = await _repo.deleteCity(event.id);
        res.fold(
          (l) => emit(DeleteCityFailed(message: l.message)),
          (r) => emit(DeleteCitySuccess()),
        );
      },
    );
    on<AddCityLocationEvent>(
      (event, emit) async {
        emit(AddCityLocationLoading());
        final res = await _repo.addCityLocation(event.location);
        res.fold(
          (l) => emit(AddCityLocationFailed(message: l.message)),
          (r) => emit(AddCityLocationSuccess(location: r.payload!)),
        );
      },
    );

    on<DeleteCityLocationEvent>(
      (event, emit) async {
        emit(DeleteCityLocationLoading());
        final res = await _repo.deleteCityLocation(event.id);
        res.fold(
          (l) => emit(DeleteCityLocationFailed(message: l.message)),
          (r) => emit(DeleteCityLocationSuccess()),
        );
      },
    );
  }
}
