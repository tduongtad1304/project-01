// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bookings_cubit.dart';

class BookingsState extends Equatable {
  final List<Equipments> equipments;
  final List<MeetingRooms> meetingRooms;

  const BookingsState({
    required this.equipments,
    required this.meetingRooms,
  });

  factory BookingsState.initial() {
    return const BookingsState(
      equipments: [],
      meetingRooms: [],
    );
  }
  @override
  List<Object> get props => [equipments, meetingRooms];

  BookingsState copyWith({
    List<Equipments>? equipments,
    List<MeetingRooms>? meetingRooms,
  }) {
    return BookingsState(
      equipments: equipments ?? this.equipments,
      meetingRooms: meetingRooms ?? this.meetingRooms,
    );
  }
}
