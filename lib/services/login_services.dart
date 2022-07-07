import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nsg_biolab_clone/services/dio_error_handler.dart';

import '../exceptions/login_exceptions.dart';

class LoginServices {
  String? token;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Future<String> login(String email, String password) async {
    const api = 'https://nsg-bio.vinova.sg/api/v1.0.0/sessions/authorize';
    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    dio.Response response;
    try {
      response = await dio.Dio().post(api, data: formData);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        if (response.data == null) {
          throw LoginException('Login failed');
        }
        String token = response.data['data']['token'] as String;
        await _storage.write(key: 'TOKEN', value: token);
        return token;
      } else {
        throw Exception(dioErrorHandler(response));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkAuthorize() async {
    token = await _storage.read(key: 'TOKEN');
    if (token != null) {
      await onLogin(token!);
    }
    return token != null;
  }

  Future<void> onLogin(String? token) async {
    log('Sign in with token: $token');
    await _storage.write(key: 'TOKEN', value: token);
    token = token;
  }

  Future<void> logOut() async {
    await _storage.delete(key: 'TOKEN');
    token = null;
    log('Delete token and Sign out');
  }
}
