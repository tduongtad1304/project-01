import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../cubits/cubits.dart';
import '../../models/bookings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBookingMeetingRoom extends StatefulWidget {
  const NewBookingMeetingRoom({Key? key}) : super(key: key);

  @override
  State<NewBookingMeetingRoom> createState() => _NewBookingMeetingRoomState();
}

class _NewBookingMeetingRoomState extends State<NewBookingMeetingRoom> {
  @override
  Widget build(BuildContext context) {
    final meetingRooms = context.watch<BookingsCubit>().state.meetingRooms;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: meetingRooms.length,
                  itemBuilder: (context, index) {
                    return MeetingRoomsCard(meetingRooms: meetingRooms[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
            // Text(context.watch<CounterCubit>().state.counterValue.toString(),
            //     style: kTextPrimary.copyWith(fontSize: 48)),
            // const SizedBox(
            //   height: 25,
            // ),
            // ElevatedButton(
            //   onPressed: context.read<CounterCubit>().increment,
            //   child: Text(
            //     'Increment',
            //     style: kTextPrimary.copyWith(color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MeetingRoomsCard extends StatefulWidget {
  final MeetingRooms meetingRooms;

  const MeetingRoomsCard({Key? key, required this.meetingRooms})
      : super(key: key);

  @override
  State<MeetingRoomsCard> createState() => _MeetingRoomsCardState();
}

class _MeetingRoomsCardState extends State<MeetingRoomsCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite = false;
    return Container(
      padding:
          const EdgeInsets.only(left: 17, right: 23, top: 20, bottom: 18.7),
      height: 100,
      width: 366,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 217, 217, 217),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.meetingRooms.meetingRoomName,
                style: kTitlePrimary.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 6.7,
              ),
              Text(
                widget.meetingRooms.meetingRoomLocation,
                style: kTextPrimary.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          _buildFavouriteButton(isFavourite),
        ],
      ),
    );
  }

  Widget _buildFavouriteButton(bool isFavourited) {
    return Align(
      alignment: const Alignment(1, -3),
      child: IconButton(
        icon: Icon(
          isFavourited ? Icons.favorite : Icons.favorite_border,
          color: kPrimaryButtons,
        ),
        onPressed: () {},
      ),
    );
  }
}
