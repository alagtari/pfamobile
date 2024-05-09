import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/driver/domain/repositories/driver_repository.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';
part 'event.dart';
part 'state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  final _repo = sl<DriverRepository>();

  DriverBloc() : super(DriverInitial()) {
    on<DriverEvent>((event, emit) {});
    on<GetDriversEvent>(
      (event, emit) async {
        emit(GetDriversLoading());
        final res = await _repo.getDrivers();
        res.fold(
          (l) => emit(GetDriversFailed(message: l.message)),
          (r) => emit(GetDriversSuccess(drivers: r.payload!)),
        );
      },
    );

    on<AddDriverEvent>(
      (event, emit) async {
        emit(AddDriverLoading());
        final res = await _repo.addDriver(event.driver);
        res.fold(
          (l) => emit(AddDriverFailed(message: l.message)),
          (r) => emit(AddDriverSuccess()),
        );
      },
    );
    on<UpdateDriverEvent>(
      (event, emit) async {
        emit(UpdateDriverLoading());
        final res = await _repo.updateDriver(event.driver, event.id);
        res.fold(
          (l) => emit(UpdateDriverFailed(message: l.message)),
          (r) => emit(UpdateDriverSuccess()),
        );
      },
    );
    on<DeleteDriverEvent>(
      (event, emit) async {
        emit(DeleteDriverLoading());
        final res = await _repo.deleteDriver(event.id);
        res.fold(
          (l) => emit(DeleteDriverFailed(message: l.message)),
          (r) => emit(DeleteDriverSuccess()),
        );
      },
    );
  }
}
