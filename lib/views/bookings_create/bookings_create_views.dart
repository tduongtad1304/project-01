import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nsg_biolab_clone/constants/constants.dart';

class BookingsCreate extends StatefulWidget {
  const BookingsCreate({Key? key}) : super(key: key);

  @override
  State<BookingsCreate> createState() => _BookingsCreateState();
}

class _BookingsCreateState extends State<BookingsCreate> {
  final _formKey = GlobalKey<FormState>();
  String? bookingsId;
  String? bookingsName;
  String? bookingsLocation;
  String? bookingsDateTime;
  final String errorMessage = 'Please input again';
  List<String> bookingInfo = [];
  bool isValidating = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController newBookingsController = TextEditingController();

  void _submit() async {
    setState(() {
      isValidating = !isValidating;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bookingInfo.addAll([bookingsId!, bookingsName!, bookingsLocation!, bookingsDateTime!]);

      log(bookingInfo.toList().toString());
      Navigator.of(context).pop(bookingInfo);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void _exit() {
    if (bookingsId == null || bookingsName == null || bookingsLocation == null || bookingsDateTime == null) {
      Navigator.of(context).pop(bookingInfo);
    }
  }

  @override
  void dispose() {
    newBookingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 85, 85, 85),
          ),
          onPressed: () => _exit(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Create Bookings', style: kTitlePrimary),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  labelText: 'Bookings ID',
                  hintText: 'Enter bookings ID',
                  icon: Icons.numbers,
                  validator: (String? input) {
                    if (input!.isEmpty || input.trim().length < 2) {
                      return 'Please enter a valid bookings ID';
                    }
                    return null;
                  },
                  onSaved: (String? input) {
                    bookingsId = input;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  labelText: 'Bookings Name',
                  hintText: 'Enter bookings name',
                  icon: Icons.description,
                  validator: (String? input) {
                    if (input!.isEmpty || input.trim().length < 2) {
                      return 'Please enter a valid bookings name';
                    }
                    return null;
                  },
                  onSaved: (String? input) {
                    bookingsName = input;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  labelText: 'Bookings Location',
                  hintText: 'Enter bookings location',
                  icon: Icons.location_city,
                  validator: (String? input) {
                    if (input!.isEmpty || input.trim().length < 2) {
                      return 'Please enter a valid bookings location';
                    }
                    return null;
                  },
                  onSaved: (String? input) {
                    bookingsLocation = input;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  labelText: 'Bookings Datetime',
                  hintText: 'Enter bookings Datetime',
                  icon: Icons.date_range,
                  validator: (String? input) {
                    if (input!.isEmpty || input.trim().length < 2) {
                      return 'Please enter a valid bookings date time';
                    }
                    return null;
                  },
                  onSaved: (String? input) {
                    bookingsDateTime = input;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: 130,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryButtons,
                    ),
                    onPressed: () {
                      _submit();
                      // context
                      //     .read<BookingsCubit>()
                      //     .createBookings(bookingsId!, 'abc', 'abc', '2022-12-12');
                    },
                    icon: isValidating == false ? const Icon(Icons.search) : Container(),
                    label: isValidating == false
                        ? const Text(
                            'Submit',
                            style: TextStyle(fontSize: 18),
                          )
                        : const SizedBox(
                            height: 28,
                            width: 28,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
