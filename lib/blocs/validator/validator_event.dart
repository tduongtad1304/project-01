part of 'validator_bloc.dart';

abstract class ValidatorEvent extends Equatable {
  const ValidatorEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class EidChangeEvent extends ValidatorEvent {
  final String eid;

  const EidChangeEvent({required this.eid});

  @override
  List<Object> get props => [eid];
}

class NameChangeEvent extends ValidatorEvent {
  final String name;

  const NameChangeEvent({required this.name});

  @override
  List<Object> get props => [name];
}

class LocationChangeEvent extends ValidatorEvent {
  final String location;

  const LocationChangeEvent({required this.location});

  @override
  List<Object> get props => [location];
}

class DateTimeChangeEvent extends ValidatorEvent {
  final String dateTime;

  const DateTimeChangeEvent({required this.dateTime});

  @override
  List<Object> get props => [dateTime];
}

class SubmitEvent extends ValidatorEvent {}

class ExitEvent extends ValidatorEvent {}
