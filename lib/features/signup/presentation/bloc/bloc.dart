import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/signup/domain/repositories/signup_repository.dart';
import 'package:mobile/features/signup/data/models/signup_model.dart';
part 'event.dart';
part 'state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final _repo = sl<SignupRepository>();

  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});

    on<SignupUserEvent>(
      (event, emit) async {
        emit(SignupUserLoading());
        final res = await _repo.signup(event.request);
        res.fold(
          (l) => emit(SignupUserFailed(message: l.message)),
          (r) => emit(SignupUserSuccess()),
        );
      },
    );
  }
}
