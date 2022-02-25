import 'package:flutter/material.dart';
import 'package:hello_flutter/models/room.dart';
import 'room_item.dart';

Widget buildGridviewRooms(BuildContext context, List<Room> _rooms) {
  return GridView.builder(
    padding: const EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),
    shrinkWrap: true,
    itemCount: _rooms.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
    itemBuilder: (context, int index) {
      return room_item(context, _rooms[index]);
    },
  );
}
