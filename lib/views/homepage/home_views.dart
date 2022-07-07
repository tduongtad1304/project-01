import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubits.dart';
import '../../widgets/widgets.dart';
import '../views.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('NSG Biolab', style: kTitlePrimary.copyWith(letterSpacing: 0.32)),
      ),
      body: Stack(
        children: [
          const CustomTriangle(rotate: 180, offset: Offset(1, -1), angle: 90, a: 277, b: 167, color: Color.fromARGB(220, 251, 235, 240)),
          const CustomTriangle(rotate: 90, offset: Offset(-1, -1), angle: 90, a: 241, b: 277, color: Color.fromARGB(210, 229, 248, 242)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('You have no active bookings', style: kTitlePrimary.copyWith(fontWeight: FontWeight.w900, color: Colors.black)),
              ),
              const SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Click the', style: kTextPrimary.copyWith(fontSize: 15)),
                  const SizedBox(width: 12),
                  SvgPicture.asset('assets/images/coolicon.svg'),
                  const SizedBox(width: 12),
                  Text('below to add new bookings', style: kTextPrimary.copyWith(fontSize: 15)),
                ],
              ),
              const SizedBox(height: 17),
              Text(context.watch<CounterCubit>().state.counterValue.toString(), style: kTextPrimary.copyWith(fontSize: 20)),
            ],
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: 62,
        height: 62,
        child: FloatingActionButton(
          heroTag: 'my_home_fab',
          backgroundColor: kPrimaryButtons,
          onPressed: () {
            Navigator.push(
              context,
              createRoute(const NewBookings()),
            );
          },
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
