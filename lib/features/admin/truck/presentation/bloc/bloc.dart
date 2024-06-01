import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/driver/data/models/driver_model.dart';
import 'package:mobile/features/admin/truck/domain/repositories/truck_repository.dart';
import 'package:mobile/features/admin/truck/data/models/truck_model.dart';
part 'event.dart';
part 'state.dart';

class TruckBloc extends Bloc<TruckEvent, TruckState> {
  final _repo = sl<TruckRepository>();

  TruckBloc() : super(TruckInitial()) {
    on<TruckEvent>((event, emit) {});
    on<GetTrucksEvent>(
      (event, emit) async {
        emit(GetTrucksLoading());
        final res = await _repo.getTrucks();
        res.fold(
          (l) => emit(GetTrucksFailed(message: l.message)),
          (r) => emit(GetTrucksSuccess(trucks: r.payload!)),
        );
      },
    );
    on<GetAvailableDriversEvent>(
      (event, emit) async {
        emit(GetAvailableDriversLoading());
        final res = await _repo.getAvailableDrivers();
        res.fold(
          (l) => emit(GetAvailableDriversFailed(message: l.message)),
          (r) => emit(GetAvailableDriversSuccess(drivers: r.payload!)),
        );
      },
    );

    on<AddTruckEvent>(
      (event, emit) async {
        emit(AddTruckLoading());
        final res = await _repo.addTruck(event.truck);
        res.fold(
          (l) => emit(AddTruckFailed(message: l.message)),
          (r) => emit(AddTruckSuccess()),
        );
      },
    );
    on<UpdateTruckEvent>(
      (event, emit) async {
        emit(UpdateTruckLoading());
        final res = await _repo.updateTruck(event.truck, event.id);
        res.fold(
          (l) => emit(UpdateTruckFailed(message: l.message)),
          (r) => emit(UpdateTruckSuccess()),
        );
      },
    );
    on<DeleteTruckEvent>(
      (event, emit) async {
        emit(DeleteTruckLoading());
        final res = await _repo.deleteTruck(event.id);
        res.fold(
          (l) => emit(DeleteTruckFailed(message: l.message)),
          (r) => emit(DeleteTruckSuccess()),
        );
      },
    );
  }
}
