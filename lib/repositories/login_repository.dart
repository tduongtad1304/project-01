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
      final token = await loginServices.login(email, password);
      return token;
    } on LoginException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
