import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nsg_biolab_clone/models/bookings.dart';
import 'package:nsg_biolab_clone/models/custom_error.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> with HydratedMixin {
  BookingsCubit() : super(BookingsState.init());

  void createBookings(String bookingsId, String bookingsName,
      String bookingsLocation, String bookingsDateTime) {
    try {
      emit(state.copyWith(
        equipments: [
          ...state.equipments,
          Equipments(
              equipmentId: bookingsId,
              equipmentName: bookingsName,
              equipmentLocation: bookingsLocation,
              equipmentDateTime: bookingsDateTime)
        ],
      ));
    } catch (e) {
      emit(state.copyWith(error: CustomError(errMsg: e.toString())));
    }
  }

  void deleteBookings(String bookingsId) {
    emit(state.copyWith(
      equipments: state.equipments
          .where((equipments) => equipments.id != bookingsId)
          .toList(),
    ));
  }

  void toggleFavorite(String id) {
    emit(state.copyWith(
      isFavourite: !state.isFavourite,
    ));
    final int index =
        state.equipments.indexWhere((equipment) => equipment.id == id);
    if (index != -1) {
      emit(state.copyWith(
        equipments: state.equipments.map((items) {
          if (items.id == id) {
            return items.copyWith(isFavorite: !items.isFavorite);
          }
          return items;
        }).toList(),
      ));
    } else {
      emit(state.copyWith(
          error: const CustomError(errMsg: 'Equipment not found')));
    }
  }

  @override
  BookingsState? fromJson(Map<String, dynamic> json) {
    return BookingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BookingsState state) {
    return state.toMap();
  }
}
