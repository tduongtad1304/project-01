part of 'favourite_bookings_cubit.dart';

class FavouriteBookingsState extends Equatable {
  final List<Equipments> favouriteEquipments;
  // final List<MeetingRooms> favouriteMeetingRooms;

  const FavouriteBookingsState({
    required this.favouriteEquipments,
    // required this.favouriteMeetingRooms,
  });

  factory FavouriteBookingsState.init() => const FavouriteBookingsState(
        favouriteEquipments: [],
        // favouriteMeetingRooms: [],
      );

  @override
  List<Object> get props => [favouriteEquipments];

  @override
  bool get stringify => true;

  FavouriteBookingsState copyWith({
    List<Equipments>? favouriteEquipments,
    // List<MeetingRooms>? favouriteMeetingRooms,
  }) {
    return FavouriteBookingsState(
      favouriteEquipments: favouriteEquipments ?? this.favouriteEquipments,
      // favouriteMeetingRooms:
      //     favouriteMeetingRooms ?? this.favouriteMeetingRooms,
    );
  }
}
