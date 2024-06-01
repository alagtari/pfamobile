part of 'bloc.dart';

@immutable
abstract class PlanState {
  const PlanState();
}

class PlanInitial extends PlanState {}

class GetPlansLoading extends PlanState {}

class GetPlansSuccess extends PlanState {
  final List<PlanModel> plans;
  const GetPlansSuccess({
    required this.plans,
  });
}

class GetPlansFailed extends PlanState {
  final String message;

  const GetPlansFailed({
    required this.message,
  });
}

class AddPlanLoading extends PlanState {}

class AddPlanSuccess extends PlanState {}

class AddPlanFailed extends PlanState {
  final String message;

  const AddPlanFailed({
    required this.message,
  });
}

class UpdatePlanLoading extends PlanState {}

class UpdatePlanSuccess extends PlanState {}

class UpdatePlanFailed extends PlanState {
  final String message;

  const UpdatePlanFailed({
    required this.message,
  });
}

class DeletePlanLoading extends PlanState {}

class DeletePlanSuccess extends PlanState {}

class DeletePlanFailed extends PlanState {
  final String message;

  const DeletePlanFailed({
    required this.message,
  });
}
