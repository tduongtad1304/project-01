part of 'login_bloc.dart';

class LoginState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormzStatus formzStatus;
  final CustomError error;
  final bool isSubmitting;
  const LoginState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.formzStatus = FormzStatus.pure,
    this.error = const CustomError(errMsg: ''),
    this.isSubmitting = false,
  });

  @override
  List<Object> get props => [email, password, formzStatus, error, isSubmitting];

  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    FormzStatus? formzStatus,
    CustomError? error,
    bool? isSubmitting,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formzStatus: formzStatus ?? this.formzStatus,
      error: error ?? this.error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  bool get stringify => true;
}
