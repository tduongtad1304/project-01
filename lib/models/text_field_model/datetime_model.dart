import 'package:formz/formz.dart';

enum DateTimeInputError {
  invalidEid,
  emptyEid,
}

class DateTimeInput extends FormzInput<String, DateTimeInputError> {
  const DateTimeInput.pure() : super.pure('');
  const DateTimeInput.dirty({String value = ''}) : super.dirty(value);

  @override
  DateTimeInputError? validator(String value) {
    if (value.trim().length < 5) {
      return DateTimeInputError.invalidEid;
    }
    return value.isNotEmpty == true ? null : DateTimeInputError.emptyEid;
  }
}
