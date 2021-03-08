import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/profile.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: 400,
                height: 50,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 180.0),
                child: Text(
                  "Social Login",
                  style: TextStyle(
                      fontSize: 35, fontFamily: "Arial", color: Colors.black),
                )),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Image.asset(
                  "assets/as.png",
                  width: 50,
                )),
            Container(
              width: 400,
              height: 50,
              margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 80.0),
              child: SignInButton(Buttons.GoogleDark, onPressed: () {
                onGoogleSignIn(context);
              }),
            ),
            Divider(
              height: 25,
            ),
            Container(
                width: 400,
                height: 50,
                margin: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: SignInButton(Buttons.Facebook, onPressed: () {})),
          ],
        ),
      ),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return user;
  }

  return user;
}

showLoaderDialog() {
  BuildContext context;
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void onGoogleSignIn(BuildContext context) async {
  User user = await signInWithGoogle();
  var userSignedIn = Navigator.push(context,
      MaterialPageRoute(builder: (context) => ProfilePage(user, googleSignIn)));
}
