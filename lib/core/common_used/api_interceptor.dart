import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'app_prefs.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this.prefs);

  final AppPrefs prefs;

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = prefs.getToken();
    if (token != null) {
      options.headers.addAll({"Authorization": "Bearer $token"});
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
