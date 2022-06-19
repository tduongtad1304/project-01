import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';

class NewBookings extends StatelessWidget {
  const NewBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: kPrimaryButtons,
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 85, 85, 85),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('New Bookings',
            style: kTitlePrimary.copyWith(letterSpacing: 0.32)),
      ),
      body: const Center(
        child: Text('New Bookings'),
      ),
    );
  }
}
