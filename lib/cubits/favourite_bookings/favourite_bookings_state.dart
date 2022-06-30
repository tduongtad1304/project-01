part of 'favourite_bookings_cubit.dart';

class FavouriteBookingsState extends Equatable {
  final List<Equipments> favouriteEquipments;
  // final List<MeetingRooms> favouriteMeetingRooms;

  const FavouriteBookingsState({
    required this.favouriteEquipments,
    // required this.favouriteMeetingRooms,
  });

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

  // Map<String, dynamic> toMap() {
  //   return {
  //     'favouriteEquipments': favouriteEquipments.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory FavouriteBookingsState.fromMap(Map<String, dynamic> map) {
  //   return FavouriteBookingsState(
  //     favouriteEquipments: List<Equipments>.from(
  //         map['favouriteEquipments']?.map((x) => Equipments.fromMap(x))),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory FavouriteBookingsState.fromJson(String source) =>
  //     FavouriteBookingsState.fromMap(json.decode(source));
}
