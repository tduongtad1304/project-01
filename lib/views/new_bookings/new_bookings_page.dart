import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsg_biolab_clone/cubits/cubits.dart';
import 'package:nsg_biolab_clone/models/bookings.dart';
import 'package:nsg_biolab_clone/views/views.dart';

import '../../blocs/validator/validator_bloc.dart';

class NewBookings extends StatefulWidget {
  const NewBookings({Key? key}) : super(key: key);

  @override
  State<NewBookings> createState() => _NewBookingsState();
}

Equipments? equipments;
bool? isEquipment;
late TabController tabController;
late List<String> bookingsInfo;

class _NewBookingsState extends State<NewBookings> with TickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    isEquipment = true;
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          isEquipment = !isEquipment!;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          isEquipment!
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_outlined, color: kPrimaryButtons),
                )
              : Container(),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 85, 85, 85)),
          onPressed: () => Navigator.of(context).pop(context.read<CounterCubit>().state.counterValue),
        ),
        centerTitle: true,
        title: Text('New Bookings', style: kTitlePrimary.copyWith(letterSpacing: 0.32)),
        bottom: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.black45,
          indicatorWeight: 3,
          indicatorColor: kPrimaryButtons,
          labelColor: kPrimaryButtons,
          labelStyle: kTextPrimary.copyWith(fontWeight: FontWeight.w600),
          tabs: const [
            Tab(height: 62, text: 'Equipments'),
            Tab(height: 62, text: 'Meeting Room'),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        IndexedStack(children: const [NewBookingEquipments()]),
        IndexedStack(children: const [NewBookingMeetingRoom()]),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bookingsInfo = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider<ValidatorBloc>(
              create: (context) => ValidatorBloc(),
              child: const CreateBookings(),
            ),
          ));

          if (bookingsInfo.isEmpty) {
            return;
          } else {
            context.read<BookingsCubit>().createBookings(bookingsInfo[0], bookingsInfo[1], bookingsInfo[2], bookingsInfo[3]);
          }
        },
        child: const Icon(Icons.new_label),
        backgroundColor: kPrimaryButtons,
      ),
    );
  }
}
