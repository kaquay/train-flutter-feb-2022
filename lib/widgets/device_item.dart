import 'package:flutter/material.dart';
import 'package:hello_flutter/models/device.dart';

class ListDevice extends StatelessWidget {
  final Device devices;
  const ListDevice({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: SizedBox(
        width: 108,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(devices.color[0], devices.color[1],
                  devices.color[2], devices.color[3]),
              elevation: 0.0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundImage: AssetImage(devices.img),
              ),
              Text(
                devices.Name,
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.black),
              ),
              Text(devices.status,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
