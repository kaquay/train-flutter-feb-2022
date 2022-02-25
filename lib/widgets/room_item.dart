import 'package:flutter/material.dart';
import 'package:hello_flutter/models/room.dart';

Widget room_item(BuildContext context, Room _room) {
  return SizedBox(
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(
              _room.color[0], _room.color[1], _room.color[2], _room.color[3]),
          elevation: 0.0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            backgroundImage: AssetImage(_room.avt),
          ),
          Container(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(_room.name,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(
                        _room.textColor[0],
                        _room.textColor[1],
                        _room.textColor[2],
                        _room.textColor[3]))),
          ),
          Container(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(_room.device,
                style: TextStyle(
                    color: Color.fromARGB(
                        _room.textColor[0],
                        _room.textColor[1],
                        _room.textColor[2],
                        _room.textColor[3]))),
          ),
        ],
      ),
    ),
  );
}
