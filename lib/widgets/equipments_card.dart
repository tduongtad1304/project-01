import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import '../cubits/cubits.dart';
import '../models/bookings.dart';
import 'widgets.dart';

class EquipmentsCard extends StatefulWidget {
  final Equipments equipments;

  const EquipmentsCard({Key? key, required this.equipments}) : super(key: key);

  @override
  State<EquipmentsCard> createState() => _EquipmentsCardState();
}

class _EquipmentsCardState extends State<EquipmentsCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavourited;
    int index = context.watch<BookingsCubit>().state.equipments.indexOf(widget.equipments);
    index == -1 ? isFavourited = false : isFavourited = context.watch<BookingsCubit>().state.equipments[index].isFavorite;

    return Container(
      padding: const EdgeInsets.only(left: 17, right: 23, top: 18.0, bottom: 16.0),
      height: 100,
      width: 366,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 217, 217, 217), width: 1),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.equipments.equipmentName, style: kTitlePrimary.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(
                height: 6.7,
              ),
              Text(widget.equipments.equipmentId, style: kTextPrimary.copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
              Text(widget.equipments.equipmentLocation, style: kTextPrimary.copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
            ],
          ),
          _buildFavouriteButton(isFavourited),
          _buildDeleteButton(),
        ],
      ),
    );
  }

  Widget _buildFavouriteButton(bool isFavourited) {
    return Align(
      alignment: const Alignment(1, -3),
      child: IconButton(
        icon: Icon(isFavourited ? Icons.favorite : Icons.favorite_border, color: kPrimaryButtons),
        onPressed: () {
          context.read<BookingsCubit>().toggleFavorite(widget.equipments.id);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(buildSnackBar(
                snackBarContent: isFavourited ? 'Equipment removed from Favourites' : 'Equipment added to Favourites',
                milliseconds: 1000,
                width: 250));
        },
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Align(
      alignment: const Alignment(1, 1.5),
      child: IconButton(
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
          onPressed: () {
            context.read<BookingsCubit>().deleteBookings(widget.equipments.id);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(buildSnackBar(snackBarContent: 'Equipment deleted', milliseconds: 1200, width: 180));
            log(context.read<BookingsCubit>().state.equipments.toString());
          }),
    );
  }
}
