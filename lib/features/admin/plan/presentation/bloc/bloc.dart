import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/plan/domain/repositories/plan_repository.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
part 'event.dart';
part 'state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final _repo = sl<PlanRepository>();

  PlanBloc() : super(PlanInitial()) {
    on<PlanEvent>((event, emit) {});
    on<GetPlansEvent>(
      (event, emit) async {
        emit(GetPlansLoading());
        final res = await _repo.getPlans();
        res.fold(
          (l) => emit(GetPlansFailed(message: l.message)),
          (r) => emit(GetPlansSuccess(plans : r.payload!)),
        );
      },
    );

    on<AddPlanEvent>(
      (event, emit) async {
        emit(AddPlanLoading());
        final res = await _repo.addPlan(event.plan);
        res.fold(
          (l) => emit(AddPlanFailed(message: l.message)),
          (r) => emit(AddPlanSuccess()),
        );
      },
    );
    on<UpdatePlanEvent>(
      (event, emit) async {
        emit(UpdatePlanLoading());
        final res = await _repo.updatePlan(event.plan,event.id);
        res.fold(
          (l) => emit(UpdatePlanFailed(message: l.message)),
          (r) => emit(UpdatePlanSuccess()),
        );
      },
    );
     on<DeletePlanEvent>(
      (event, emit) async {
        emit(DeletePlanLoading());
        final res = await _repo.deletePlan(event.id);
        res.fold(
          (l) => emit(DeletePlanFailed(message: l.message)),
          (r) => emit(DeletePlanSuccess()),
        );
      },
    );

  }
  
}
