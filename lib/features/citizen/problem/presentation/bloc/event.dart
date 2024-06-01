part of 'bloc.dart';

@immutable
abstract class ProblemEvent {
  const ProblemEvent();
}

class AddProblemEvent extends ProblemEvent {
  final ProblemModel incident;
  const AddProblemEvent({
    required this.incident,
  });
}
