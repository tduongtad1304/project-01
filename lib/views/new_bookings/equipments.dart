import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsg_biolab_clone/cubits/bookings/bookings_cubit.dart';
import '../../constants/constants.dart';
import '../../models/bookings.dart';

class NewBookingEquipments extends StatefulWidget {
  const NewBookingEquipments({
    Key? key,
  }) : super(key: key);

  @override
  State<NewBookingEquipments> createState() => _NewBookingEquipmentsState();
}

class _NewBookingEquipmentsState extends State<NewBookingEquipments> {
  @override
  Widget build(BuildContext context) {
    final equipments = context.watch<BookingsCubit>().state.equipments;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Visibility(
              visible: equipments.isNotEmpty,
              child: Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: equipments.length,
                    itemBuilder: (context, index) {
                      return EquipmentsCard(
                        equipments: equipments[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EquipmentsCard extends StatefulWidget {
  final Equipments equipments;

  const EquipmentsCard({Key? key, required this.equipments}) : super(key: key);

  @override
  State<EquipmentsCard> createState() => _EquipmentsCardState();
}

class _EquipmentsCardState extends State<EquipmentsCard> {
  bool isFavourited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 17, right: 23, top: 18.0, bottom: 16.0),
      height: 100,
      width: 366,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 217, 217, 217),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.equipments.equipmentName,
                style: kTitlePrimary.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 6.7,
              ),
              Text(
                widget.equipments.equipmentId,
                style: kTextPrimary.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                widget.equipments.equipmentLocation,
                style: kTextPrimary.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
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
        icon: Icon(
          isFavourited ? Icons.favorite : Icons.favorite_border,
          color: kPrimaryButtons,
        ),
        onPressed: () {},
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
            ScaffoldMessenger.of(context).showSnackBar(
              _buildSnackBar(
                  snackBarContent: 'Equipment deleted', milliseconds: 1200),
            );
          }),
    );
  }

  SnackBar _buildSnackBar({
    required String snackBarContent,
    required int milliseconds,
  }) {
    return SnackBar(
      padding: const EdgeInsets.all(5),
      width: 200,
      behavior: SnackBarBehavior.floating,
      backgroundColor: kPrimaryButtons,
      elevation: 1,
      content: Text(
        snackBarContent,
        textAlign: TextAlign.center,
        style: kTextPrimary.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      duration: Duration(milliseconds: milliseconds),
    );
  }
}
