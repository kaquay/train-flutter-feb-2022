import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/route/homepage.dart';
import 'package:hello_flutter/screens/addroom.dart';
import 'package:hello_flutter/widgets/room_item.dart';
import 'package:hello_flutter/screens/home_screen.dart';
import 'package:hello_flutter/screens/living_room.dart';
import 'package:hello_flutter/screens/login_screen.dart';
import 'package:hello_flutter/firebase_options.dart';
import 'package:hello_flutter/screens/prolife_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // kiem tra nguoi dung da dang nhap
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // neu co nguoi dung thi chuyen sang man hinh home
            return GoingHome();
          } else {
            return const LoginWidget();
          }
        },
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const LivingRoom(),
//       ),
//     );
//   }
// }
