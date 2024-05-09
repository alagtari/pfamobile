import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/city/domain/repositories/city_repository.dart';
import 'package:mobile/features/city/data/models/city_model.dart';
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
          (r) => emit(GetCitiesSuccess(cities : r.payload!)),
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
    on<UpdateCityEvent>(
      (event, emit) async {
        emit(UpdateCityLoading());
        final res = await _repo.updateCity(event.city,event.id);
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

  }
  
}
