import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nsg_biolab_clone/models/bookings.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit() : super(BookingsState.initial());
}
