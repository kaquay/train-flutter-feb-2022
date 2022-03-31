import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/models/device.dart';

class DeviceItem extends StatefulWidget {
  final Device devices;

  const DeviceItem({Key? key, required this.devices}) : super(key: key);

  @override
  State<DeviceItem> createState() => _DeviceItem();
}

class _DeviceItem extends State<DeviceItem> {
  CollectionReference device =
      FirebaseFirestore.instance.collection('device_item');

  Future<void> updateStatus() {
    if (widget.devices.status == 'On') {
      widget.devices.status = 'Off';
      return device
          .doc(widget.devices.id)
          .update({'status': 'Off'})
          .then((value) => print('ok rồi'))
          .catchError((error) => print('Lỗi rồi: $error'));
    } else {
      widget.devices.status = 'On';
      return device
          .doc(widget.devices.id)
          .update({'status': 'On'})
          .then((value) => print('ok rồi'))
          .catchError((error) => print('Lỗi rồi: $error'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: SizedBox(
        width: 108,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              updateStatus();
            });
          },
          style: ElevatedButton.styleFrom(
              primary: Color(widget.devices.color),
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
                backgroundImage: AssetImage(widget.devices.img),
              ),
              Text(
                widget.devices.Name,
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.black),
              ),
              Text(widget.devices.status,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
