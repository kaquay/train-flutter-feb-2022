import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/main.dart';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/screens/detail_room.dart';
import 'package:hello_flutter/screens/living_room.dart';
import 'package:hello_flutter/widgets/drawer_item.dart';

class BuildDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .where("id", isEqualTo: user.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          final List<DocumentSnapshot> detailUser = snapshot.data!.docs;
          return DrawItem(id: detailUser[0].id);
        });
  }
}
