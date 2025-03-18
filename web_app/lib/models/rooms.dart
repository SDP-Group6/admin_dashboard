class Room {
  final String name;
  final String floor;
  final int noOfKeyboards;

  const Room({
    required this.name,
    required this.floor,
    required this.noOfKeyboards,
  });

  // Example list of rooms
  static const List<Room> sampleRooms = [
    Room(name: "M 21 ISO", floor: "2nd Floor", noOfKeyboards: 12),
    Room(name: "V.3.3 ISO", floor: "3rd Floor", noOfKeyboards: 12),
    Room(name: "F 7.2 ISO", floor: "7th Floor", noOfKeyboards: 24),
  ];
}
