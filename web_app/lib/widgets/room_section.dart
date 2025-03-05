import 'package:flutter/material.dart';
import '../models/room.dart';

class MeetingRoomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rooms", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          ),
          child: Column(
            children: Room.sampleRooms.map((room) => Column(
              children: [
                MeetingRoomItem(meetingRoom: room),
                if (room != Room.sampleRooms.last) Divider(),
              ],
            )).toList(),
          ),
        ),
      ],
    );
  }
}

class MeetingRoomItem extends StatelessWidget {
  final Room meetingRoom;

  MeetingRoomItem({required this.meetingRoom});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meetingRoom.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(meetingRoom.floor),
      trailing: ElevatedButton(
        onPressed: () {}, 
        child: Text("View"),
      ),
    );
  }
}
