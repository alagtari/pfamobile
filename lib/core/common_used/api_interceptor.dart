import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'app_prefs.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  final prefs = sl<AppPrefs>();

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
