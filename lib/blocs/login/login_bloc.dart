import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nsg_biolab_clone/models/custom_error.dart';
import 'package:nsg_biolab_clone/models/text_field_model/email_model.dart';
import 'package:nsg_biolab_clone/models/text_field_model/password_model.dart';
import 'package:nsg_biolab_clone/repositories/login_repository.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submit>(_onSubmit);
  }

  _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final emailInput = EmailInput.dirty(event.email);

    emit(
      state.copyWith(
        email: emailInput,
        formzStatus: Formz.validate([
          emailInput,
          state.password,
        ]),
      ),
    );
  }

  _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final passwordInput = PasswordInput.dirty(event.password);

    emit(
      state.copyWith(
        password: passwordInput,
        formzStatus: Formz.validate([
          passwordInput,
          state.email,
        ]),
      ),
    );
  }

  Future<void> _onSubmit(Submit event, Emitter<LoginState> emit) async {
    if (state.formzStatus.isValidated) {
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      try {
        await loginRepository
            .login(
          state.email.value,
          state.password.value,
        )
            .then((token) {
          emit(state.copyWith(
            email: const EmailInput.pure(),
            password: const PasswordInput.pure(),
            token: token,
            error: const CustomError(errMsg: ''),
            formzStatus: FormzStatus.submissionSuccess,
          ));
        });
      } on CustomError catch (e) {
        emit(state.copyWith(formzStatus: FormzStatus.submissionFailure, isSubmitting: true, error: e));
      }
    }
  }

  Future<bool> checkAuthorize() async {
    final bool isAuth = await loginRepository.checkAuthorize();
    return isAuth;
  }

  Future<void> logOut() async {
    await loginRepository.logOut();
  }
}
