import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomSection extends StatelessWidget {
  const RoomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rooms",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
          ),
          child: Column(
            children: Room.sampleRooms.map((room) {
              return Column(
                children: [
                  RoomItem(room: room),
                  if (room != Room.sampleRooms.last) const Divider(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class RoomItem extends StatelessWidget {
  final Room room;

  const RoomItem({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        room.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(room.floor),
      trailing: ElevatedButton(
        onPressed: () {
          // TODO: Implement room details page navigation
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Viewing ${room.name}")),
          );
        },
        child: const Text("View"),
      ),
    );
  }
}
