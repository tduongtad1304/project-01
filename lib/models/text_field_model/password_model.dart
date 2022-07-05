//validate password
import 'package:formz/formz.dart';

//return invalid if password does not match with expression
enum PasswordValidationError { empty, invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.trim().length < 6) {
      return PasswordValidationError.invalid;
    }
    return value.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
