import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nsg_biolab_clone/models/bookings.dart';
import 'package:nsg_biolab_clone/models/custom_error.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit() : super(BookingsState.init());
  void loadDefaultEquipments() {
    emit(state.copyWith(status: BookingsStatus.loading));
    final equipments = [
      Equipments(
          equipmentName: 'Computer',
          equipmentId: 'CPT007',
          equipmentLocation: 'Vietnam',
          equipmentDateTime: '2022'),
      Equipments(
          equipmentName: 'Laser',
          equipmentId: 'LS001',
          equipmentLocation: 'Vietnam',
          equipmentDateTime: '2020'),
    ];
    emit(state.copyWith(
      status: BookingsStatus.loaded,
      equipments: equipments,
    ));
  }

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
}
