import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsg_biolab_clone/views/login/login_page.dart';

import '../../blocs/login/login_bloc.dart';
import '../../constants/constants.dart';
import '../../repositories/login_repository.dart';
import '../../services/login_services.dart';
import '../../widgets/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black54),
            onPressed: () {},
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('My Profile', style: kTitlePrimary.copyWith(letterSpacing: 0.32)),
      ),
      body: Stack(
        children: [
          const CustomTriangle(rotate: 180, offset: Offset(1, -1), angle: 90, a: 277, b: 120, color: Color.fromARGB(220, 251, 235, 240)),
          const CustomTriangle(rotate: 90, offset: Offset(-1, -1), angle: 90, a: 173, b: 277, color: Color.fromARGB(210, 229, 248, 242)),
          Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 19.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(radius: 62.5, backgroundImage: NetworkImage(netWorkImageUrl, scale: 0.5)),
              ),
            ),
            const SizedBox(height: 11),
            Center(
              child: Text('Edit Photo', style: kTextPrimary.copyWith(fontSize: 14, color: kPrimaryButtons)),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryButtons,
                  ),
                  child: Text('Logout', style: kTextPrimary.copyWith(color: Colors.white)),
                  onPressed: () {
                    context.read<LoginBloc>().logOut();
                    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                        createRoute(
                          RepositoryProvider(
                            create: (context) => LoginRepository(loginServices: LoginServices()),
                            child: BlocProvider<LoginBloc>(
                              create: (context) => LoginBloc(
                                loginRepository: context.read<LoginRepository>(),
                              ),
                              child: const LoginPage(),
                            ),
                          ),
                        ),
                        (route) => false);
                  },
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
