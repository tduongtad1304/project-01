import 'package:flutter/material.dart';
import 'package:nsg_biolab_clone/blocs/validator/validator_bloc.dart';
import 'package:nsg_biolab_clone/cubits/cubits.dart';
import 'package:nsg_biolab_clone/views/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider<ValidatorBloc>(
          create: (context) => ValidatorBloc(),
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
        home: const MainPage(),
      ),
    );
  }
}
