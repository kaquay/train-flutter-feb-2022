import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidget createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: TextButton(
              onPressed: signInWithGoogle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FaIcon(FontAwesomeIcons.google),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sign In Google',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                  )
                ],
              ),
            ),
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(252, 175, 214, 231),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // thuc hien dang nhap bang google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // nhan tai khoan xac thuc
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // tao mot thong tin dang nhap
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    
    // sau khi dang nhap tra ve thong tin dang nhap
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
