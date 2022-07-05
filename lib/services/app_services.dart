import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppServices {
  String? _token;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final Dio _dio = Dio();

  Future<AppServices> init() async {
    setInterceptor();
    await checkAuthorize();
    return this;
  }

  Dio get netWork {
    _dio.options.headers['Authorization'] = 'Bearer $_token';
    _dio.options.baseUrl = 'https://nsg-bio.vinova.sg/api/v1.0.0/';
    return _dio;
  }

  void setInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Request to ${options.baseUrl}${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('Response from ${response.requestOptions.baseUrl}${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (error, handler) {
          if (error.response?.data['message'] != null) {
            log(error.response?.data['message']);
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<void> checkAuthorize() async {
    _token = await _storage.read(key: 'token');
    if (_token != null) {
      await onLogin(_token!);
    }
  }

  Future<void> onLogin(String? token) async {
    log('Sign in with token: $token');
    await _storage.write(key: 'token', value: token);
    _token = token;
  }
}
