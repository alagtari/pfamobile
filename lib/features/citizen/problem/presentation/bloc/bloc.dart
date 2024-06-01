import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/citizen/problem/data/models/problem_model.dart';
import 'package:mobile/features/citizen/problem/domain/repositories/problem_repository.dart';
part 'event.dart';
part 'state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final _repo = sl<ProblemRepository>();

  ProblemBloc() : super(ProblemInitial()) {
    on<ProblemEvent>((event, emit) {});

    on<AddProblemEvent>(
      (event, emit) async {
        emit(AddProblemLoading());
        final res = await _repo.addProblem(event.incident);
        res.fold(
          (l) => emit(AddProblemFailed(message: l.message)),
          (r) => emit(AddProblemSuccess()),
        );
      },
    );
  }
}
