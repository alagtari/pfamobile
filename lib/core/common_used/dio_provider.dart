import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api_interceptor.dart';

class DioProvider {
  static Dio instance() => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          baseUrl: "${dotenv.env['BACKEND_BASE_URL']}",

          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      )..interceptors.addAll(
          [
            ApiInterceptor(),
            // if (!kReleaseMode)
            //   LogInterceptor(
            //     requestBody: true,
            //     responseBody: false,
            //   ),
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
