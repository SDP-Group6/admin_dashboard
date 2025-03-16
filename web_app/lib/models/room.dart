class Room {
  final String name;
  final String floor;
  final int capacity;
  final bool hasScreen;

  const Room({
    required this.name,
    required this.floor,
    required this.capacity,
    required this.hasScreen,
  });

  // Example static list of rooms
  static const List<Room> sampleRooms = [
    Room(name: "M 21 ISO", floor: "2nd Floor", capacity: 12, hasScreen: false),
    Room(name: "V.3.3 ISO", floor: "3rd Floor", capacity: 12, hasScreen: true),
    Room(name: "F 7.2 ISO", floor: "7th Floor", capacity: 24, hasScreen: true),
  ];
}
