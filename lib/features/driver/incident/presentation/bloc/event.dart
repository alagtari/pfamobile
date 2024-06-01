part of 'bloc.dart';

@immutable
abstract class IncidentEvent {
  const IncidentEvent();
}

class AddIncidentEvent extends IncidentEvent {
  final IncidentModel incident;
  const AddIncidentEvent({
    required this.incident,
  });
}
