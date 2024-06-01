part of 'bloc.dart';

@immutable
abstract class ProblemState {
  const ProblemState();
}

class ProblemInitial extends ProblemState {}



class AddProblemLoading extends ProblemState {}

class AddProblemSuccess extends ProblemState {}

class AddProblemFailed extends ProblemState {
  final String message;

  const AddProblemFailed({
    required this.message,
  });
}
