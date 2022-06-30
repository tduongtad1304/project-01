// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

abstract class Bookings extends Equatable {}

Uuid uuid = const Uuid();

class Equipments implements Bookings {
  final String id;
  final String equipmentName;
  final String equipmentId;
  final String equipmentLocation;
  final String equipmentDateTime;
  final bool isFavorite;

  Equipments({
    String? id,
    required this.equipmentName,
    required this.equipmentId,
    required this.equipmentLocation,
    required this.equipmentDateTime,
    this.isFavorite = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, equipmentName, equipmentId, equipmentLocation, equipmentDateTime, isFavorite];

  @override
  bool? get stringify => true;

  Equipments copyWith({
    String? id,
    String? equipmentName,
    String? equipmentId,
    String? equipmentLocation,
    String? equipmentDateTime,
    bool? isFavorite,
  }) {
    return Equipments(
      id: id ?? this.id,
      equipmentName: equipmentName ?? this.equipmentName,
      equipmentId: equipmentId ?? this.equipmentId,
      equipmentLocation: equipmentLocation ?? this.equipmentLocation,
      equipmentDateTime: equipmentDateTime ?? this.equipmentDateTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  String toString() {
    return 'Equipments(id: $id, equipmentName: $equipmentName, equipmentId: $equipmentId, equipmentLocation: $equipmentLocation, equipmentDateTime: $equipmentDateTime, isFavorite: $isFavorite)';
  }

  static fromMap(x) {
    return Equipments(
      id: x['id'],
      equipmentName: x['equipmentName'],
      equipmentId: x['equipmentId'],
      equipmentLocation: x['equipmentLocation'],
      equipmentDateTime: x['equipmentDateTime'],
      isFavorite: x['isFavorite'],
    );
  }

  toMap() {
    return {
      'id': id,
      'equipmentName': equipmentName,
      'equipmentId': equipmentId,
      'equipmentLocation': equipmentLocation,
      'equipmentDateTime': equipmentDateTime,
      'isFavorite': isFavorite,
    };
  }
}

class MeetingRooms implements Bookings {
  final String id;
  final String meetingRoomName;
  final String meetingRoomLocation;
  final String meetingRoomDateTime;
  final bool isFavorite;

  MeetingRooms({
    String? id,
    required this.meetingRoomName,
    required this.meetingRoomLocation,
    required this.meetingRoomDateTime,
    this.isFavorite = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, meetingRoomName, meetingRoomLocation, meetingRoomDateTime, isFavorite];

  @override
  bool? get stringify => true;

  MeetingRooms copyWith({
    String? id,
    String? meetingRoomName,
    String? meetingRoomLocation,
    String? meetingRoomDateTime,
    bool? isFavorite,
  }) {
    return MeetingRooms(
      id: id ?? this.id,
      meetingRoomName: meetingRoomName ?? this.meetingRoomName,
      meetingRoomLocation: meetingRoomLocation ?? this.meetingRoomLocation,
      meetingRoomDateTime: meetingRoomDateTime ?? this.meetingRoomDateTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  static fromMap(x) {
    return MeetingRooms(
      id: x['id'],
      meetingRoomName: x['meetingRoomName'],
      meetingRoomLocation: x['meetingRoomLocation'],
      meetingRoomDateTime: x['meetingRoomDateTime'],
      isFavorite: x['isFavorite'],
    );
  }

  toMap() {
    return {
      'id': id,
      'meetingRoomName': meetingRoomName,
      'meetingRoomLocation': meetingRoomLocation,
      'meetingRoomDateTime': meetingRoomDateTime,
      'isFavorite': isFavorite,
    };
  }
}

//creating sample model for bookings

// final List<Equipments> equipments = [
//   const Equipments(
//     equipmentName: 'BSC 1 (Thermo)',
//     equipmentId: 'NSG-0001',
//     equipmentLocation: 'Level 1, Main Lab Space',
//     equipmentDateTime: 'May 7 (Fri) 1030 - 1200',
//     // isFavorite: false,
//   ),
//   const Equipments(
//     equipmentName: 'Equipment 2',
//     equipmentId: 'EQ-2',
//     equipmentLocation: 'Location 2',
//     equipmentDateTime: 'DateTime 2',
//     // isFavorite: false,
//   ),
//   const Equipments(
//     equipmentName: 'Equipment 3',
//     equipmentId: 'EQ-3',
//     equipmentLocation: 'Location 3',
//     equipmentDateTime: 'DateTime 3',
//     // isFavorite: false,
//   ),
//   const Equipments(
//     equipmentName: 'Equipment 4',
//     equipmentId: 'EQ-4',
//     equipmentLocation: 'Location 4',
//     equipmentDateTime: 'DateTime 4',
//     // isFavorite: false,
//   ),
//   const Equipments(
//     equipmentName: 'Equipment 5',
//     equipmentId: 'EQ-5',
//     equipmentLocation: 'Location 5',
//     equipmentDateTime: 'DateTime 5',
//     // isFavorite: false,
//   ),
//   const Equipments(
//     equipmentName: 'Equipment 6',
//     equipmentId: 'EQ-6',
//     equipmentLocation: 'Location 6',
//     equipmentDateTime: 'DateTime 6',
//     // isFavorite: false,
//   ),
//   const Equipments(
//     equipmentName: 'Equipment 7',
//     equipmentId: 'EQ-7',
//     equipmentLocation: 'Location 7',
//     equipmentDateTime: 'DateTime 7',
//     // isFavorite: false,
//   ),
// ];

// final List<MeetingRooms> meetingRooms = [
//   const MeetingRooms(
//     meetingRoomName: 'Meeting Room 1',
//     meetingRoomLocation: 'Location 1',
//     meetingRoomDateTime: 'DateTime 1',
//     isFavorite: false,
//   ),
//   const MeetingRooms(
//     meetingRoomName: 'Meeting Room 2',
//     meetingRoomLocation: 'Location 2',
//     meetingRoomDateTime: 'DateTime 2',
//     isFavorite: false,
//   ),
//   const MeetingRooms(
//     meetingRoomName: 'Meeting Room 3',
//     meetingRoomLocation: 'Location 3',
//     meetingRoomDateTime: 'DateTime 3',
//     isFavorite: false,
//   ),
//   const MeetingRooms(
//     meetingRoomName: 'Meeting Room 4',
//     meetingRoomLocation: 'Location 4',
//     meetingRoomDateTime: 'DateTime 4',
//     isFavorite: false,
//   ),
//   const MeetingRooms(
//     meetingRoomName: 'Meeting Room 5',
//     meetingRoomLocation: 'Location 5',
//     meetingRoomDateTime: 'DateTime 5',
//     isFavorite: false,
//   ),
//   const MeetingRooms(
//     meetingRoomName: 'Meeting Room 6',
//     meetingRoomLocation: 'Location 6',
//     meetingRoomDateTime: 'DateTime 6',
//     isFavorite: false,
//   ),
// ];
