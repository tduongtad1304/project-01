part of 'login_bloc.dart';

class LoginState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormzStatus formzStatus;
  final String token;
  final CustomError error;
  final bool isSubmitting;
  const LoginState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.formzStatus = FormzStatus.pure,
    required this.token,
    this.error = const CustomError(errMsg: ''),
    this.isSubmitting = false,
  });

  @override
  List<Object> get props => [email, password, formzStatus, token, error, isSubmitting];

  factory LoginState.initial() => const LoginState(token: '');
  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    FormzStatus? formzStatus,
    String? token,
    CustomError? error,
    bool? isSubmitting,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formzStatus: formzStatus ?? this.formzStatus,
      token: token ?? this.token,
      error: error ?? this.error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  bool get stringify => true;
}
