import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_flutter/main.dart';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/screens/addroom.dart';
import 'package:hello_flutter/screens/living_room.dart';
import 'package:hello_flutter/screens/drawer_slide_menu.dart';
import 'package:hello_flutter/widgets/room_item.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  // lay thong tin user
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseAuth khoa = FirebaseAuth.instance;
  ScrollController sc = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: BuildDrawer(),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(children: [
            _buildAppbar(context),
            _buildWelcomePlace(context),
            _buildAddroom(context),
            _buildGridviewRooms(context),
          ]),
        ),
      ),
    );
  }

  Widget _buildAddroom(BuildContext context) {
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
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddRoom()),
              );
            },
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

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('rooms');

  Widget _buildGridviewRooms(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('rooms')
            .where('idUser', isEqualTo: user.uid)
            .get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Đang tải...'));
          }
          final List<DocumentSnapshot> documents = snapshot.data.docs;
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),
            shrinkWrap: true,
            itemCount: documents.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemBuilder: (BuildContext context, int index) {
              Room nr = Room(
                  documents[index].id,
                  documents[index]['name'],
                  documents[index]['color'],
                  documents[index]['avt'],
                  documents[index]['device'],
                  documents[index]['textcolor'],
                  documents[index]['humidity'],
                  documents[index]['temperature']);

              return RoomItem(room: nr);
            },
          );
        }

        //   return ListView(
        //       shrinkWrap: true,
        //       children: documents
        //           .map((doc) => Card(
        //                 child: ListTile(
        //                   title: Text(doc['name']),
        //                   subtitle: Text(doc['device']),
        //                 ),
        //               ))
        //           .toList());
        // },
        // child: GridView.builder(
        //   padding: const EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),
        //   shrinkWrap: true,
        //   itemCount: _rooms.length,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        //   itemBuilder: (context, int index) {
        //     return RoomItem(room: _rooms[index]);
        //   },
        // ),
        );
  }

  Widget _buildAppbar(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(
                Icons.grid_view_rounded,
                size: 40,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/icon.png'),
            )
            // IconButton(
            //     // thuc hien dang xuat tai khoan
            //     onPressed: () {

            //     },
            //     icon: const FaIcon(FontAwesomeIcons.signOutAlt)),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomePlace(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 16.0, 0.0, 4.0),
            child: Text(
              '${user.displayName}',
              style:
                  const TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
            ),
          ),
          const Image(image: AssetImage('assets/images/hello.png'))
        ],
      ),
      Container(
          padding: const EdgeInsets.only(left: 32.0),
          child: const Text('Wellcome to Orix Home.',
              style: TextStyle(
                fontSize: 20.0,
              )))
    ]);
  }
}
