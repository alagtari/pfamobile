part of 'bloc.dart';

@immutable
abstract class ProblemState {
  const ProblemState();
}

class ProblemInitial extends ProblemState {}

class GetProblemsLoading extends ProblemState {}

class GetProblemsSuccess extends ProblemState {
  final List<ProblemModel> problems;
  const GetProblemsSuccess({
    required this.problems,
  });
}

class GetProblemsFailed extends ProblemState {
  final String message;

  const GetProblemsFailed({
    required this.message,
  });
}
class GetIncidentsLoading extends ProblemState {}

class GetIncidentsSuccess extends ProblemState {
  final List<ProblemModel> incidents;
  const GetIncidentsSuccess({
    required this.incidents,
  });
}

class GetIncidentsFailed extends ProblemState {
  final String message;

  const GetIncidentsFailed({
    required this.message,
  });
}
