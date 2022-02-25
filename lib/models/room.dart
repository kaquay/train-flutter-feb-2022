class Room {
  String name;
  // ignore_for_file: prefer_typing_uninitialized_variables
  var color;
  String avt;
  String device;
  var textColor;
  Room(this.name, this.color, this.avt, this.device, this.textColor);
}

// var arr = [255, 0, 0, 0];

List<Room> _rooms = <Room>[
  Room('Livingroom', [255, 0, 0, 0], 'assets/images/livingroom.webp',
      '5 devices', [255, 255, 255, 255]),
  Room('Kitchen', [255, 254, 246, 229], 'assets/images/kitchen.jpg',
      '4 devices', [255, 0, 0, 0]),
  Room('Office ', [255, 233, 231, 247], 'assets/images/iconoffice.png',
      '10 devices', [255, 0, 0, 0]),
  Room('Bedroom ', [255, 207, 235, 244], 'assets/images/bedroom.png',
      '6 devices', [255, 0, 0, 0]),
  Room('Bathroom ', [255, 250, 235, 232], 'assets/images/bathroom.png',
      '7 devices', [255, 0, 0, 0]),
  Room('Dinning ', [255, 239, 247, 229], 'assets/images/dinning.webp',
      '4 devices', [255, 0, 0, 0]),
];
