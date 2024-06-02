import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/problem/domain/repositories/problem_repository.dart';
import 'package:mobile/features/admin/problem/data/models/problem_model.dart';
part 'event.dart';
part 'state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final _repo = sl<AdminProblemRepository>();

  ProblemBloc() : super(ProblemInitial()) {
    on<ProblemEvent>((event, emit) {});
    on<GetProblemsEvent>(
      (event, emit) async {
        emit(GetProblemsLoading());
        final res = await _repo.getProblems();
        res.fold(
          (l) => emit(GetProblemsFailed(message: l.message)),
          (r) => emit(GetProblemsSuccess(problems: r.payload!)),
        );
      },
    );
    on<GetIncidentsEvent>(
      (event, emit) async {
        emit(GetIncidentsLoading());
        final res = await _repo.getIncidents();
        res.fold(
          (l) => emit(GetIncidentsFailed(message: l.message)),
          (r) => emit(GetIncidentsSuccess(incidents: r.payload!)),
        );
      },
    );
  }
}
