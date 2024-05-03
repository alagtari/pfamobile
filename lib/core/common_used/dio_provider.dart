import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'api_interceptor.dart';

class DioProvider {
  static Dio instance() => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          baseUrl: "http://localhost:5000/api",
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      )..interceptors.addAll(
          [
            ApiInterceptor(sl()),
            if (!kReleaseMode)
              LogInterceptor(
                requestBody: true,
                responseBody: false,
              ),
          ],
        );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
