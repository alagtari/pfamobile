part of 'bloc.dart';

@immutable
abstract class PlanEvent {
  const PlanEvent();
}

class AddPlanEvent extends PlanEvent {
  final PlanModel plan;
  const AddPlanEvent({
    required this.plan,
  });
}

class UpdatePlanEvent extends PlanEvent {
  final PlanModel plan;
  final String id;

  const UpdatePlanEvent({
    required this.plan,
    required this.id,
  });
}

class GetPlansEvent extends PlanEvent {}

class DeletePlanEvent extends PlanEvent {
  final String id;
  const DeletePlanEvent({
    required this.id,
  });
}
