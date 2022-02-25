import 'package:flutter/material.dart';

Widget buildAddroom(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
    child: Row(
      children: [
        const Text(
          'Your ',
          style: TextStyle(fontSize: 30),
        ),
        const Text(
          'Rooms',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              primary: const Color.fromARGB(255, 226, 246, 245),
              elevation: 0.0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
          child: Row(
            children: const [
              Text(
                'Add  ',
                style: TextStyle(color: Color.fromARGB(255, 77, 192, 192)),
              ),
              Icon(
                Icons.add_circle,
                color: Color.fromARGB(255, 77, 192, 192),
              )
            ],
          ),
        )
      ],
    ),
  );
}
