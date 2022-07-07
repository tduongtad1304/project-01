import 'package:flutter/foundation.dart';
import 'package:nsg_biolab_clone/exceptions/login_exceptions.dart';
import 'package:nsg_biolab_clone/models/custom_error.dart';

import '../services/login_services.dart';

class LoginRepository {
  final LoginServices loginServices;
  LoginRepository({
    required this.loginServices,
  });

  Future<String> login(String email, String password) async {
    try {
      final userToken = await loginServices.login(email, password);
      if (kDebugMode) {
        print('token: $userToken');
      }
      return userToken;
    } on LoginException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }

  Future<bool> checkAuthorize() async {
    final isAuth = await loginServices.checkAuthorize();
    return isAuth;
  }

  Future<void> logOut() async {
    await loginServices.logOut();
  }
}
