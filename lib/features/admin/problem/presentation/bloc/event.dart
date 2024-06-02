part of 'bloc.dart';

@immutable
abstract class ProblemEvent {
  const ProblemEvent();
}



class GetProblemsEvent extends ProblemEvent {}
class GetIncidentsEvent extends ProblemEvent {}

