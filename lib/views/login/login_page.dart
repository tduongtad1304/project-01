import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:nsg_biolab_clone/blocs/login/login_bloc.dart';
import '../../constants/constants.dart';
import '/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      checkAuthorized();
    });
    super.initState();
  }

  Future<bool> checkAuthorized() async {
    bool? isAuth;
    await Future.delayed(const Duration(milliseconds: 350));
    isAuth = await context.read<LoginBloc>().checkAuthorize();
    if (isAuth) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Login'),
          content: Text('Please wait few seconds while we check your authorization info....'),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 650));
      Navigator.of(context).pushNamedAndRemoveUntil('/mainpage', (route) => false);
    } else {
      return false;
    }
    return isAuth;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Login', style: kTitlePrimary.copyWith(letterSpacing: 0.32)),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.formzStatus.isSubmissionSuccess) {
            Navigator.of(context).pushReplacementNamed('/mainpage');
          }
          if (state.formzStatus.isSubmissionFailure) {
            errorDialog(context, state.error.errMsg);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                initialValue: context.watch<LoginBloc>().state.email.value,
                labelText: 'Email',
                hintText: 'Enter your email',
                errorText: context.watch<LoginBloc>().state.email.invalid ? 'Invalid email' : null,
                icon: Icons.email,
                onChanged: (String value) {
                  context.read<LoginBloc>().add(EmailChanged(email: value));
                },
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                initialValue: context.watch<LoginBloc>().state.password.value,
                labelText: 'Password',
                hintText: 'Enter your password',
                errorText: context.watch<LoginBloc>().state.password.invalid ? 'Invalid password' : null,
                obscureText: false,
                icon: Icons.password,
                onChanged: (String value) {
                  context.read<LoginBloc>().add(PasswordChanged(password: value));
                },
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryButtons,
                  ),
                  onPressed: context.watch<LoginBloc>().state.formzStatus.isValidated
                      ? () {
                          context.read<LoginBloc>().add(Submit());
                        }
                      : null,
                  child: !context.watch<LoginBloc>().state.formzStatus.isSubmissionInProgress
                      ? Text('Login', style: kTitlePrimary.copyWith(color: Colors.white, letterSpacing: 1))
                      : const Center(
                          child: SizedBox(
                          height: 28,
                          width: 28,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
