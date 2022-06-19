// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Bookings extends Equatable {}

class Equipments implements Bookings {
  final String equipmentName;
  final String equipmentId;
  final String equipmentLocation;
  final String equipmentDateTime;

  const Equipments({
    required this.equipmentName,
    required this.equipmentId,
    required this.equipmentLocation,
    required this.equipmentDateTime,
  });

  @override
  List<Object> get props =>
      [equipmentName, equipmentId, equipmentLocation, equipmentDateTime];

  @override
  bool? get stringify => true;

  Equipments copyWith({
    String? equipmentName,
    String? equipmentId,
    String? equipmentLocation,
    String? equipmentDateTime,
  }) {
    return Equipments(
      equipmentName: equipmentName ?? this.equipmentName,
      equipmentId: equipmentId ?? this.equipmentId,
      equipmentLocation: equipmentLocation ?? this.equipmentLocation,
      equipmentDateTime: equipmentDateTime ?? this.equipmentDateTime,
    );
  }
}

class MeetingRooms implements Bookings {
  final String meetingRoomName;
  final String meetingRoomLocation;
  final String meetingRoomDateTime;

  const MeetingRooms({
    required this.meetingRoomName,
    required this.meetingRoomLocation,
    required this.meetingRoomDateTime,
  });

  @override
  List<Object> get props =>
      [meetingRoomName, meetingRoomLocation, meetingRoomDateTime];

  @override
  bool? get stringify => true;

  MeetingRooms copyWith({
    String? meetingRoomName,
    String? meetingRoomLocation,
    String? meetingRoomDateTime,
  }) {
    return MeetingRooms(
      meetingRoomName: meetingRoomName ?? this.meetingRoomName,
      meetingRoomLocation: meetingRoomLocation ?? this.meetingRoomLocation,
      meetingRoomDateTime: meetingRoomDateTime ?? this.meetingRoomDateTime,
    );
  }
}

//creating sample model for bookings

final List<Equipments> equipments = [
  const Equipments(
    equipmentName: 'BSC 1 (Thermo)',
    equipmentId: 'NSG-0001',
    equipmentLocation: 'Level 1, Main Lab Space',
    equipmentDateTime: 'May 7 (Fri) 1030 - 1200',
  ),
  const Equipments(
    equipmentName: 'Equipment 2',
    equipmentId: 'EQ-2',
    equipmentLocation: 'Location 2',
    equipmentDateTime: 'DateTime 2',
  ),
];

final List<MeetingRooms> meetingRooms = [
  const MeetingRooms(
    meetingRoomName: 'Meeting Room 1',
    meetingRoomLocation: 'Location 1',
    meetingRoomDateTime: 'DateTime 1',
  ),
  const MeetingRooms(
    meetingRoomName: 'Meeting Room 2',
    meetingRoomLocation: 'Location 2',
    meetingRoomDateTime: 'DateTime 2',
  ),
];
