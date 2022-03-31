import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/firebase_options.dart';
import 'package:hello_flutter/main.dart';
import 'package:hello_flutter/screens/home_screen.dart';
import 'package:hello_flutter/screens/prolife_screen.dart';

class GoingHome extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Stream<QuerySnapshot> check = FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .snapshots();
  GoingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot<Object?>> checked =
        users.where('email', isEqualTo: user.email).snapshots();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        // kiem tra nguoi dung da dang nhap
        stream: check,
        builder: (context, snapshot) {
          // ignore: unnecessary_null_comparison
          if (snapshot.data?.size == 0) {
            return const ProlifeScreen();
          } else {
            return const Home();
          }

          // return Home();
        },
      ),
    );
  }
}
