import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/features/driver/home/domain/repositories/driver_plan_repository.dart';
part 'event.dart';
part 'state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final _repo = sl<DriverPlanRepository>();

  PlanBloc() : super(PlanInitial()) {
    on<PlanEvent>((event, emit) {});
    on<GetPlansEvent>(
      (event, emit) async {
        emit(GetPlansLoading());
        final res = await _repo.getPlans();
        res.fold(
          (l) => emit(GetPlansFailed(message: l.message)),
          (r) => emit(GetPlansSuccess(plans: r.payload!)),
        );
      },
    );
  }
}
