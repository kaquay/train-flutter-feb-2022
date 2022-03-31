import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/screens/detail_room.dart';
import 'package:hello_flutter/screens/living_room.dart';

import '../main.dart';

class DrawItem extends StatelessWidget {
  String id;
  DrawItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(id).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Drawer(
            child: Material(
              color: const Color.fromARGB(255, 233, 246, 248),
              child: ListView(children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data!['avt']),
                      )),
                  // child:
                ),
                ListTile(
                  title: Text(snapshot.data!['email']),
                ),
                ListTile(
                  title: Text(snapshot.data!['name']),
                ),
                ListTile(
                  title: Text(snapshot.data!['addr']),
                ),
                ListTile(
                  title: Text(snapshot.data!['id']),
                ),
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    icon: FaIcon(FontAwesomeIcons.signOutAlt))
              ]),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
