class LoginException implements Exception {
  String message;

  LoginException([this.message = 'Something went wrong']) {
    message = 'Login exception $message';
  }

  @override
  String toString() {
    return message;
  }
}
