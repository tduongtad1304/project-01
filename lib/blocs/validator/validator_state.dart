part of 'validator_bloc.dart';

class ValidatorState extends Equatable {
  final EidInput eidInput;
  final NameInput nameInput;
  final LocationInput locationInput;
  final DateTimeInput dateTimeInput;
  final FormzStatus formzStatus;

  const ValidatorState({
    this.eidInput = const EidInput.pure(),
    this.nameInput = const NameInput.pure(),
    this.locationInput = const LocationInput.pure(),
    this.dateTimeInput = const DateTimeInput.pure(),
    this.formzStatus = FormzStatus.pure,
  });

  @override
  List<Object> get props => [
        eidInput,
        nameInput,
        locationInput,
        dateTimeInput,
        formzStatus,
      ];

  ValidatorState copyWith({
    EidInput? eidInput,
    NameInput? nameInput,
    LocationInput? locationInput,
    DateTimeInput? dateTimeInput,
    FormzStatus? formzStatus,
  }) {
    return ValidatorState(
      eidInput: eidInput ?? this.eidInput,
      nameInput: nameInput ?? this.nameInput,
      locationInput: locationInput ?? this.locationInput,
      dateTimeInput: dateTimeInput ?? this.dateTimeInput,
      formzStatus: formzStatus ?? this.formzStatus,
    );
  }
}
