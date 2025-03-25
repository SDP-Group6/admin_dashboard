import 'package:flutter/material.dart';
import '../models/rooms.dart';

class RoomSection extends StatefulWidget {
  const RoomSection({super.key});

  @override
  _RoomSectionState createState() => _RoomSectionState();
}

class _RoomSectionState extends State<RoomSection> {
  final Map<String, bool> _expandedRooms = {};

  void _toggleExpand(String roomName) {
    setState(() {
      _expandedRooms[roomName] = !(_expandedRooms[roomName] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rooms",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children:
              Room.sampleRooms.map((room) {
                return _roomContainer(
                  child: RoomItem(
                    room: room,
                    borderColor: borderColor,
                    isExpanded: _expandedRooms[room.name] ?? false,
                    onExpand: () => _toggleExpand(room.name),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _roomContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 226, 203, 252),
            Color.fromARGB(255, 154, 164, 211),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }
}

class RoomItem extends StatelessWidget {
  final Room room;
  final Color borderColor;
  final bool isExpanded;
  final VoidCallback onExpand;

  const RoomItem({
    super.key,
    required this.room,
    required this.borderColor,
    required this.isExpanded,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            room.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            room.floor,
            style: const TextStyle(color: Colors.black87),
          ),
          trailing: _gradientButton(
            label: isExpanded ? "Hide" : "View",
            onTap: onExpand,
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildChartPlaceholder("Chart 1")),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          _buildChartPlaceholder("Chart 2"),
                          const SizedBox(height: 10),
                          _buildTextBox("Additional Room Info"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _gradientButton({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(228, 210, 249, 1),
              Color.fromARGB(255, 229, 233, 250),
            ],
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildChartPlaceholder(String title) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTextBox(String hintText) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hintText,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
    );
  }
}
