import 'package:formz/formz.dart';

enum NameInputError {
  invalidEid,
  emptyEid,
}

class NameInput extends FormzInput<String, NameInputError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  NameInputError? validator(String value) {
    if (value.trim().length < 5) {
      return NameInputError.invalidEid;
    }
    return value.isNotEmpty == true ? null : NameInputError.emptyEid;
  }
}
