import 'package:flutter/material.dart';

Widget buildAppbar(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.grid_view_rounded,
              size: 40,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              backgroundImage: AssetImage('assets/images/icon.png'),
            ),
          ),
        ],
      ),
    ),
  );
}
