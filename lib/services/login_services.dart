import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nsg_biolab_clone/services/dio_error_handler.dart';
import 'dart:convert';

import '../exceptions/login_exceptions.dart';

class LoginServices {
  String? token;
  Future<String> login(String email, String password) async {
    const api = 'https://nsg-bio.vinova.sg/api/v1.0.0/sessions/authorize';
    final data = {'email': email, 'password': password};

    dio.Response response;
    try {
      response = await dio.Dio().post(api, data: data);
      if (response.statusCode == 200) {
        FlutterSecureStorage _storage = const FlutterSecureStorage();
        final body = json.decode(response.data);
        if (body.isEmpty) {
          throw LoginException('Login failed');
        }
        await _storage.write(key: 'TOKEN', value: body['token']);
        return body['token'] as String;
      } else {
        throw Exception(dioErrorHandler(response));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getUser() async {
    FlutterSecureStorage _storage = const FlutterSecureStorage();
    token = await _storage.read(key: 'TOKEN');

    if (token != null) {
      return token!;
    }
    return token!;
  }
}
