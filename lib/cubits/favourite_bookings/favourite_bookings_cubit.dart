import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nsg_biolab_clone/cubits/bookings/bookings_cubit.dart';
import 'package:nsg_biolab_clone/models/bookings.dart';

part 'favourite_bookings_state.dart';

class FavouriteBookingsCubit extends Cubit<FavouriteBookingsState> {
  late StreamSubscription favouriteEquipmentsSubscription;
  final BookingsCubit bookingsCubit;
  final List<Equipments> initialFavouriteEquipments;
  FavouriteBookingsCubit(
      {required this.bookingsCubit, required this.initialFavouriteEquipments})
      : super(FavouriteBookingsState(
            favouriteEquipments: initialFavouriteEquipments)) {
    favouriteEquipmentsSubscription = bookingsCubit.stream.listen((state) {
      _setFavouriteEquipments();
    });
  }

  void _setFavouriteEquipments() {
    List<Equipments> _favouriteEquipments;

    _favouriteEquipments = bookingsCubit.state.equipments
        .where((equipment) => equipment.isFavorite)
        .toList();
    emit(state.copyWith(favouriteEquipments: _favouriteEquipments));
  }

  @override
  Future<void> close() {
    favouriteEquipmentsSubscription.cancel();
    return super.close();
  }
}
