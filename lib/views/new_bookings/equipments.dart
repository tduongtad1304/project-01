import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsg_biolab_clone/cubits/bookings/bookings_cubit.dart';
import '../../widgets/widgets.dart';

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
