import 'package:flutter/material.dart';
import 'package:nsg_biolab_clone/blocs/login/login_bloc.dart';
import 'package:nsg_biolab_clone/cubits/cubits.dart';
import 'package:nsg_biolab_clone/views/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/login_repository.dart';
import 'services/login_services.dart';
import 'views/views.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingsCubit>(
          create: (context) => BookingsCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<FavouriteBookingsCubit>(
          create: (context) => FavouriteBookingsCubit(
            bookingsCubit: context.read<BookingsCubit>(),
            initialFavouriteEquipments: context.read<BookingsCubit>().state.equipments.where((element) => element.isFavorite).toList(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/mainpage': (context) => const MainPage(),
          '/': (context) => RepositoryProvider(
                create: (context) => LoginRepository(loginServices: LoginServices()),
                child: BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(loginRepository: context.read<LoginRepository>()),
                  child: const LoginPage(),
                ),
              ),
        },
      ),
    );
  }
}
