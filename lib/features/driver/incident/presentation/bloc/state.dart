part of 'bloc.dart';

@immutable
abstract class IncidentState {
  const IncidentState();
}

class IncidentInitial extends IncidentState {}



class AddIncidentLoading extends IncidentState {}

class AddIncidentSuccess extends IncidentState {}

class AddIncidentFailed extends IncidentState {
  final String message;

  const AddIncidentFailed({
    required this.message,
  });
}
