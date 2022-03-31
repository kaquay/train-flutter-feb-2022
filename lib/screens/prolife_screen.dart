import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_flutter/firebase_options.dart';
import 'package:hello_flutter/models/user.dart';
import 'package:hello_flutter/screens/home_screen.dart';

class ProlifeScreen extends StatefulWidget {
  const ProlifeScreen({Key? key}) : super(key: key);

  @override
  State<ProlifeScreen> createState() => _ProlifeScreen();
}

class _ProlifeScreen extends State<ProlifeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _formKey = GlobalKey<FormState>();
  Future<void> addUser(NguoiDung user, bool status) async {
    // Call the user's CollectionReference to add a new user
    return await users
        .add({
          'addr': user.addr,
          'avt': user.avt,
          'email': user.email,
          'name': user.fullName,
          'status': status,
          'id': user.id
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> searchUser(String email) async {
    String usID = 'l96svChxgl8YOCeKtGK0';
    return users.doc(usID).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      }
    });
  }

  Future<void> timkiem(String email) {
    return users
        .where('email', arrayContains: email)
        .get()
        .then((value) => {if (value == false) print('sai') else print('đúng')})
        .catchError((error) => print('sai me r'));
  }

  late TextEditingController addr = TextEditingController();
  late TextEditingController avt;
  late TextEditingController email;
  late TextEditingController name;
  bool status = false;
  @override
  void initState() {
    super.initState();
    avt = TextEditingController(text: '${user.photoURL}');
    email = TextEditingController(text: '${user.email}');
    name = TextEditingController(text: '${user.displayName}');
  }

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
                        // TextButton(
                        //     onPressed: () => FirebaseAuth.instance.signOut(),
                        //     child: const Text('logout')),
                        TextFormField(
                          // enabled: false,
                          controller: email,
                          decoration:
                              InputDecoration(hintText: '${user.email}'),
                        ),
                        TextFormField(
                          controller: name,
                          decoration:
                              InputDecoration(hintText: '${user.displayName}'),
                        ),
                        TextFormField(
                          controller: addr,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Address';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: 'Address'),
                        ),
                        TextFormField(
                          controller: avt,
                          decoration:
                              InputDecoration(hintText: '${user.photoURL}'),
                        ),
                        TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Đã lưu thông tin người dùng')),
                                );
                                NguoiDung nd = NguoiDung(addr.text, avt.text,
                                    email.text, name.text, user.uid);
                                addUser(nd, status);
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            child: const Text(
                              "Save Prolife",
                            )),
                      ],
                    )))));
  }
}
