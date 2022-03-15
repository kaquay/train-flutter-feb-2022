import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hello_flutter/screens/home_screen.dart';
import 'package:hello_flutter/screens/living_room.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  State<LoginGoogle> createState() => _LoginGoogle();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

Future<void> _handleSignOut() => _googleSignIn.disconnect();

class _LoginGoogle extends State<LoginGoogle> {
  late bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoggedIn
          // ? Home(
          //     isLoggedIn: _isLoggedIn,
          //     userObj: _userObj,
          //     googleSignIn: _googleSignIn,
          //   )
          ? Column(
              children: [
                Text(_userObj.email),
                TextButton(
                  onPressed: () {
                    _googleSignIn.signOut().then((value) {
                      setState(() {
                        _isLoggedIn = false;
                      });
                    }).catchError((e) {});
                  },
                  child: const Text("Logout"),
                ),
              ],
            )
          : Center(
              child: ElevatedButton(
                child: const Text("Login with Google"),
                onPressed: () {
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      _isLoggedIn = true;
                      _userObj = userData!;
                    });
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ),
    );
  }
}
