import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/text_field_model/text_field_model.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(const ValidatorState()) {
    on<EidChangeEvent>(_onEidChangeEvent);
    on<NameChangeEvent>(_onNameChangeEvent);
    on<LocationChangeEvent>(_onLocationChangeEvent);
    on<DateTimeChangeEvent>(_onDateTimeChangeEvent);
    on<SubmitEvent>(_onSubmitEvent);
    on<ExitEvent>(_onExitEvent);
  }

  FutureOr<void> _onEidChangeEvent(EidChangeEvent event, Emitter<ValidatorState> emit) {
    final eidInput = EidInput.dirty(value: event.eid);

    emit(
      state.copyWith(
        eidInput: eidInput,
        formzStatus: Formz.validate(
          [eidInput, state.nameInput, state.locationInput, state.dateTimeInput],
        ),
      ),
    );
  }

  FutureOr<void> _onNameChangeEvent(NameChangeEvent event, Emitter<ValidatorState> emit) {
    final nameInput = NameInput.dirty(value: event.name);

    emit(
      state.copyWith(
        nameInput: nameInput,
        formzStatus: Formz.validate(
          [nameInput, state.eidInput, state.locationInput, state.dateTimeInput],
        ),
      ),
    );
  }

  FutureOr<void> _onLocationChangeEvent(LocationChangeEvent event, Emitter<ValidatorState> emit) {
    final locationInput = LocationInput.dirty(value: event.location);

    emit(
      state.copyWith(
        locationInput: locationInput,
        formzStatus: Formz.validate(
          [locationInput, state.eidInput, state.nameInput, state.dateTimeInput],
        ),
      ),
    );
  }

  FutureOr<void> _onDateTimeChangeEvent(DateTimeChangeEvent event, Emitter<ValidatorState> emit) {
    final dateTimeInput = DateTimeInput.dirty(value: event.dateTime);

    emit(
      state.copyWith(
        dateTimeInput: dateTimeInput,
        formzStatus: Formz.validate(
          [dateTimeInput, state.eidInput, state.nameInput, state.locationInput],
        ),
      ),
    );
  }

  FutureOr<void> _onSubmitEvent(SubmitEvent event, Emitter<ValidatorState> emit) async {
    if (state.formzStatus.isValidated) {
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      await Future.delayed(const Duration(milliseconds: 700));
      emit(state.copyWith(
        formzStatus: FormzStatus.submissionSuccess,
      ));
      emit(const ValidatorState());
    }
  }

  FutureOr<void> _onExitEvent(ExitEvent event, Emitter<ValidatorState> emit) {
    const eidInput = EidInput.pure();
    const nameInput = NameInput.pure();
    const locationInput = LocationInput.pure();
    const dateTimeInput = DateTimeInput.pure();
    const formzStatus = FormzStatus.pure;

    emit(state.copyWith(
        eidInput: eidInput, nameInput: nameInput, locationInput: locationInput, dateTimeInput: dateTimeInput, formzStatus: formzStatus));
  }
}
