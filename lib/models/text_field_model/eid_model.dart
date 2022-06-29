import 'package:formz/formz.dart';

enum EidInputError {
  invalidEid,
  emptyEid,
}

class EidInput extends FormzInput<String, EidInputError> {
  const EidInput.pure() : super.pure('');
  const EidInput.dirty({required String value}) : super.dirty(value);

  @override
  EidInputError? validator(String value) {
    if (value.trim().length < 3) {
      return EidInputError.invalidEid;
    }
    return value.isNotEmpty == true ? null : EidInputError.emptyEid;
  }
}
