// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bookings_cubit.dart';

enum BookingsStatus {
  initial,
  loading,
  loaded,
  error,
}

class BookingsState extends Equatable {
  final BookingsStatus status;

  final List<Equipments> equipments;
  final List<MeetingRooms> meetingRooms;
  final CustomError error;
  final bool isFavourite;
  const BookingsState({
    required this.status,
    required this.equipments,
    required this.meetingRooms,
    required this.error,
    required this.isFavourite,
  });

  factory BookingsState.init() => const BookingsState(
      status: BookingsStatus.initial,
      equipments: [],
      meetingRooms: [],
      error: CustomError(errMsg: ''),
      isFavourite: false);

  @override
  List<Object?> get props =>
      [status, equipments, meetingRooms, error, isFavourite];

  @override
  bool get stringify => true;

  BookingsState copyWith({
    BookingsStatus? status,
    List<Equipments>? equipments,
    List<MeetingRooms>? meetingRooms,
    CustomError? error,
    bool? isFavourite,
  }) {
    return BookingsState(
      status: status ?? this.status,
      equipments: equipments ?? this.equipments,
      meetingRooms: meetingRooms ?? this.meetingRooms,
      error: error ?? this.error,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  String toString() {
    return 'BookingsState(status: $status, equipments: $equipments, meetingRooms: $meetingRooms, error: $error, isFavourite: $isFavourite)';
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status.index,
      'equipments': equipments.map((e) => e.toMap()).toList(),
      'meetingRooms': meetingRooms.map((e) => e.toMap()).toList(),
      'error': error.toMap(),
      'isFavourite': isFavourite,
    };
  }

  factory BookingsState.fromMap(Map<String, dynamic> map) {
    return BookingsState(
      status: BookingsStatus.values[map['status']],
      equipments: List<Equipments>.from(
          map['equipments']?.map((x) => Equipments.fromMap(x)) ?? []),
      meetingRooms: List<MeetingRooms>.from(
          map['meetingRooms']?.map((x) => MeetingRooms.fromMap(x)) ?? []),
      error: CustomError.fromMap(map['error']),
      isFavourite: map['isFavourite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingsState.fromJson(String source) =>
      BookingsState.fromMap(json.decode(source));
}
