import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/widgets/room_item.dart';
import 'package:hello_flutter/screens/home_screen.dart';
import 'package:hello_flutter/screens/living_room.dart';

void main() {
  runApp(MaterialApp(
    home: LivingRoom(),
  ));
}

// var arr = [255, 0, 0, 0];

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}


// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
//           color: const Color.fromARGB(255, 255, 255, 255),
//           child: Column(children: [
//             _buildAppbar(context),
//             _buildWelcomePlace(context),
//             _buildAddroom(context),
//             _buildGridviewRooms(context),
//           ]),
//         ),
//       ),
//     );
//   }

//   Widget _buildAddroom(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
//       child: Row(
//         children: [
//           const Text(
//             'Your ',
//             style: TextStyle(fontSize: 30),
//           ),
//           const Text(
//             'Rooms',
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//           ),
//           const Spacer(),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
//                 primary: const Color.fromARGB(255, 226, 246, 245),
//                 elevation: 0.0,
//                 shadowColor: Colors.transparent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 )),
//             child: Row(
//               children: const [
//                 Text(
//                   'Add  ',
//                   style: TextStyle(color: Color.fromARGB(255, 77, 192, 192)),
//                 ),
//                 Icon(
//                   Icons.add_circle,
//                   color: Color.fromARGB(255, 77, 192, 192),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildGridviewRooms(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),
//       shrinkWrap: true,
//       itemCount: _rooms.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
//       itemBuilder: (context, int index) {
//         return RoomItem(room: _rooms[index]);
//       },
//     );
//   }

//   Widget _buildAppbar(BuildContext context) {
//     return Container(
//       decoration:
//           const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.grid_view_rounded,
//                 size: 40,
//               ),
//             ),
//             const Spacer(),
//             TextButton(
//               onPressed: () {},
//               child: const CircleAvatar(
//                 backgroundColor: Color.fromARGB(0, 255, 255, 255),
//                 backgroundImage: AssetImage('assets/images/icon.png'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildWelcomePlace(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: const [
//           Padding(
//             padding: EdgeInsets.fromLTRB(32.0, 16.0, 0.0, 4.0),
//             child: Text(
//               'Hi Sajon',
//               style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
//             ),
//           ),
//           Image(image: AssetImage('assets/images/hello.png'))
//         ],
//       ),
//       Container(
//           padding: const EdgeInsets.only(left: 32.0),
//           child: const Text('Wellcome to Orix Home.',
//               style: TextStyle(
//                 fontSize: 20.0,
//               )))
//     ]);
//   }
// }
