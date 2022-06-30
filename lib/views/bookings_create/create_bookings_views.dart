import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsg_biolab_clone/blocs/validator/validator_bloc.dart';
import 'package:formz/formz.dart';

import '../../constants/constants.dart';

class CreateBookings extends StatefulWidget {
  const CreateBookings({Key? key}) : super(key: key);

  @override
  State<CreateBookings> createState() => _CreateBookingsState();
}

List<String> bookingInfo = [];
bool isValidating = false;

class _CreateBookingsState extends State<CreateBookings> {
  void _exit() {
    if (bookingInfo.isEmpty) {
      Navigator.of(context).pop(bookingInfo);
    } else {
      bookingInfo.clear();
      Navigator.of(context).pop(bookingInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 85, 85, 85)),
            onPressed: () {
              _exit();
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Create Bookings', style: kTitlePrimary),
      ),
      body: BlocListener<ValidatorBloc, ValidatorState>(
        listener: (context, state) {
          if (state.formzStatus.isSubmissionSuccess) {
            bookingInfo.clear();
            bookingInfo.addAll([state.eidInput.value, state.nameInput.value, state.locationInput.value, state.dateTimeInput.value]);
            log(bookingInfo.toList().toString());
            Navigator.of(context).pop(bookingInfo);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                EidInputField(),
                SizedBox(height: 20),
                NameInputField(),
                SizedBox(height: 20),
                LocationInputField(),
                SizedBox(height: 20),
                DateTimeInputField(),
                SizedBox(height: 20),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EidInputField extends StatelessWidget {
  const EidInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc, ValidatorState>(
      buildWhen: (previous, current) => previous.eidInput != current.eidInput,
      builder: (context, state) {
        return CustomTextFormField(
          initialValue: state.eidInput.value,
          labelText: 'EID',
          hintText: 'Enter EID',
          errorText: state.eidInput.invalid ? 'Invalid EID' : null,
          icon: Icons.numbers,
          onChanged: (value) {
            context.read<ValidatorBloc>().add(EidChangeEvent(eid: value));
          },
        );
      },
    );
  }
}

class NameInputField extends StatelessWidget {
  const NameInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc, ValidatorState>(
      buildWhen: (previous, current) => previous.nameInput != current.nameInput,
      builder: (context, state) {
        return CustomTextFormField(
          initialValue: state.nameInput.value,
          labelText: 'Name',
          hintText: 'Enter name',
          errorText: state.nameInput.invalid ? 'Invalid name' : null,
          icon: Icons.description,
          onChanged: (value) {
            context.read<ValidatorBloc>().add(NameChangeEvent(name: value));
          },
        );
      },
    );
  }
}

class LocationInputField extends StatelessWidget {
  const LocationInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc, ValidatorState>(
      buildWhen: (previous, current) => previous.locationInput != current.locationInput,
      builder: (context, state) {
        return CustomTextFormField(
          initialValue: state.locationInput.value,
          labelText: 'Location',
          hintText: 'Enter location',
          errorText: state.locationInput.invalid ? 'Invalid location' : null,
          icon: Icons.location_on,
          onChanged: (value) {
            context.read<ValidatorBloc>().add(LocationChangeEvent(location: value));
          },
        );
      },
    );
  }
}

class DateTimeInputField extends StatelessWidget {
  const DateTimeInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc, ValidatorState>(
      buildWhen: (previous, current) => previous.dateTimeInput != current.dateTimeInput,
      builder: (context, state) {
        return CustomTextFormField(
          initialValue: state.dateTimeInput.value,
          labelText: 'Date Time',
          hintText: 'Enter date time',
          errorText: state.dateTimeInput.invalid ? 'Invalid date time' : null,
          icon: Icons.date_range,
          onChanged: (value) {
            context.read<ValidatorBloc>().add(DateTimeChangeEvent(dateTime: value));
          },
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc, ValidatorState>(
      buildWhen: (previous, current) => previous.formzStatus != current.formzStatus,
      builder: (context, state) {
        return SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: kPrimaryButtons,
            ),
            onPressed: state.formzStatus.isValidated
                ? () {
                    context.read<ValidatorBloc>().add(SubmitEvent());
                  }
                : null,
            icon: !state.formzStatus.isSubmissionInProgress ? const Icon(Icons.subdirectory_arrow_right_sharp) : Container(),
            label: Text(state.formzStatus.isSubmissionInProgress ? 'Submitting....' : 'Submit', style: const TextStyle(fontSize: 18)),
          ),
        );
      },
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final String? errorText;
  final IconData icon;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        initialValue: initialValue,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
