import 'package:flutter/material.dart';
import '../widgets/room_section.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: RoomSection(), // Uses RoomSection
    );
  }
}
