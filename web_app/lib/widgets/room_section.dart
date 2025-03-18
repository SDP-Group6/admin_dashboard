import 'package:flutter/material.dart';
import '../models/rooms.dart';

class RoomSection extends StatefulWidget {
  const RoomSection({super.key});

  @override
  _RoomSectionState createState() => _RoomSectionState();
}

class _RoomSectionState extends State<RoomSection> {
  final Map<String, bool> _expandedRooms = {}; // Track expanded state of rooms

  void _toggleExpand(String roomName) {
    setState(() {
      _expandedRooms[roomName] = !(_expandedRooms[roomName] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme properties

    // Extract border color from theme, fallback to black if not set
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
        Container(
          decoration: BoxDecoration(
            color: theme.cardTheme.color, // Use themed card background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
              width: 2,
            ), // Apply black border
            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
          ),
          child: Column(
            children:
                Room.sampleRooms.map((room) {
                  return Column(
                    children: [
                      RoomItem(
                        room: room,
                        borderColor: borderColor,
                        isExpanded: _expandedRooms[room.name] ?? false,
                        onExpand: () => _toggleExpand(room.name),
                      ),
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
    final theme = Theme.of(context); // Access theme

    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color, // Use themed card background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2), // Apply border color
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          ListTile(
            title: Text(
              room.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(room.floor),
            trailing: ElevatedButton(
              onPressed: onExpand, // Toggle expanded state
              child: Text(isExpanded ? "Hide" : "View"),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Expandable Section Layout
                  Row(
                    children: [
                      // Chart 1 Placeholder
                      Expanded(child: _buildChartPlaceholder("Chart 1")),
                      const SizedBox(width: 10),
                      // Right Section with 2 Rows
                      Expanded(
                        child: Column(
                          children: [
                            // Chart 2 Placeholder
                            _buildChartPlaceholder("Chart 2"),
                            const SizedBox(height: 10),
                            // TextBox Placeholder
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
      ),
    );
  }

  /// Placeholder for charts
  Widget _buildChartPlaceholder(String title) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2), // Apply border color
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// Text box placeholder
  Widget _buildTextBox(String hintText) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2), // Apply border color
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
