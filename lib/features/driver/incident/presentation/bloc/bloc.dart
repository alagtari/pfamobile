import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/driver/incident/domain/repositories/incident_repository.dart';
import 'package:mobile/features/driver/incident/data/models/incident_model.dart';
part 'event.dart';
part 'state.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  final _repo = sl<IncidentRepository>();

  IncidentBloc() : super(IncidentInitial()) {
    on<IncidentEvent>((event, emit) {});

    on<AddIncidentEvent>(
      (event, emit) async {
        emit(AddIncidentLoading());
        final res = await _repo.addIncident(event.incident);
        res.fold(
          (l) => emit(AddIncidentFailed(message: l.message)),
          (r) => emit(AddIncidentSuccess()),
        );
      },
    );
  }
}
