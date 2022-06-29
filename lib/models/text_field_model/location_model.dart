import 'package:formz/formz.dart';

enum LocationInputError {
  invalidEid,
  emptyEid,
}

class LocationInput extends FormzInput<String, LocationInputError> {
  const LocationInput.pure() : super.pure('');
  const LocationInput.dirty({String value = ''}) : super.dirty(value);

  @override
  LocationInputError? validator(String value) {
    if (value.trim().length < 5) {
      return LocationInputError.invalidEid;
    }
    return value.isNotEmpty == true ? null : LocationInputError.emptyEid;
  }
}
