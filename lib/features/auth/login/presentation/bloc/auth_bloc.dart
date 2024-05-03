import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/auth/login/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/login/data/models/auth_request_model.dart';
import 'package:mobile/features/auth/login/data/models/reset_password_request_model.dart';
import 'package:mobile/features/auth/login/data/models/verify_code_request_model.dart';
import 'package:mobile/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _prefs = sl<AppPrefs>();
  final _repo = sl<AuthRepository>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginEvent>(
      (event, emit) async {
        emit(LoginLoading());
        final Completer<AuthState> completer = Completer<AuthState>();
        final res = await _repo.login(user: event.request);
        res.fold(
          (l) => completer.complete(LoginFailed(message: l.message)),
          (r) async {
            completer.complete((LoginSuccess(response: r.payload!)));
          },
        );
        await completer.future.then((value) async {
          if (value is LoginSuccess) {
            await _cacheToPrefs(value.response);
          }
          emit(value);
        });
      },
    );

    on<ForgotPasswordEmailEvent>(
      (event, emit) async {
        emit(ForgotPasswordEmailLoading());
        final res = await _repo.forgotPasswordEmail(event.email);
        res.fold(
          (l) => emit(ForgotPasswordEmailFailed(message: l.message)),
          (r) => emit(ForgotPasswordEmailSuccess()),
        );
      },
    );

    on<ForgotPasswordCodeEvent>(
      (event, emit) async {
        emit(ForgotPasswordCodeLoading());
        final res = await _repo.forgotPasswordCode(event.request);
        res.fold(
          (l) => emit(ForgotPasswordCodeFailed(message: l.message)),
          (r) => emit(ForgotPasswordCodeSuccess()),
        );
      },
    );

    on<ResendCodeEvent>(
      (event, emit) async {
        emit(ResendCodeLoading());
        final res = await _repo.resendCode(event.email);
        res.fold(
          (l) => emit(ResendCodeFailed(message: l.message)),
          (r) => emit(ResendCodeSuccess()),
        );
      },
    );

    on<ResetPasswordEvent>(
      (event, emit) async {
        emit(ResetPasswordLoading());
        final res = await _repo.resetPassword(event.request);
        res.fold(
          (l) => emit(ResetPasswordFailed(message: l.message)),
          (r) => emit(ResetPasswordSuccess()),
        );
      },
    );
  }

  Future<void> _cacheToPrefs(AuthResponseModel r) async {
    await _prefs.saveToken(r.token);
  }
}
