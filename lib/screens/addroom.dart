import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hello_flutter/firebase_options.dart';
import 'package:hello_flutter/main.dart';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/models/user.dart';
import 'package:hello_flutter/screens/home_screen.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoom();
}

class _AddRoom extends State<AddRoom> {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');
  final _formKey = GlobalKey<FormState>();
  Future<void> addRoom(Room room) async {
    // Call the user's CollectionReference to add a new user
    return await rooms
        .add({
          'name': room.name,
          'device': room.device,
          'color': room.color,
          'textcolor': room.textColor,
          'avt': room.avt
        })
        .then((value) => print("Room Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Color roomColor = Colors.lightBlue;
  Color textColor = Colors.lightBlue;

  late TextEditingController name = TextEditingController();
  late TextEditingController device = TextEditingController();
  late TextEditingController color = TextEditingController();
  late TextEditingController textcolor = TextEditingController();
  late TextEditingController avt = TextEditingController();

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Address';
                            }
                            return null;
                          },
                          controller: name,
                          decoration:
                              const InputDecoration(hintText: 'Tên phòng'),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Address';
                            }
                            return null;
                          },
                          controller: device,
                          decoration:
                              const InputDecoration(hintText: 'Số thiết bị'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Pick a color!'),
                                    content: SingleChildScrollView(
                                        child: ColorPicker(
                                      pickerColor: Colors.red, //default color
                                      onColorChanged: (Color color) {
                                        setState(() {
                                          textColor = color;
                                        });
                                        //on color picked
                                      },
                                    )),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text(
                                          'DONE',
                                          style: TextStyle(
                                              color: Color(0xff0091ea)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); //dismiss the color picker
                                          print(textColor);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text("Choose Text Color"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Pick a color!'),
                                    content: SingleChildScrollView(
                                        child: BlockPicker(
                                      pickerColor: Colors.red, //default color
                                      onColorChanged: (Color color) {
                                        setState(() {
                                          roomColor = color;
                                        });
                                        //on color picked
                                      },
                                    )),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text(
                                          'DONE',
                                          style: TextStyle(
                                              color: Color(0xff0091ea)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); //dismiss the color picker
                                          print(roomColor);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Text("Choose Room Color"),
                        ),
                        TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Đã lưu thông tin người dùng')),
                                );
                                print(name.text);
                                print(device.text);
                                print(roomColor);
                                print(textColor);
                                Room n_room = Room(
                                    user.uid,
                                    name.text,
                                    roomColor.value,
                                    '',
                                    device.text,
                                    textColor.value,
                                    0,
                                    0);
                                addRoom(n_room);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              }
                            },
                            child: const Text(
                              "Add room",
                            )),
                      ],
                    )))));
  }
}
