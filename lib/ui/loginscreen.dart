import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_application_2/ui/profile.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

bool _isloading = false;

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Text(
            "Help The Needy",
            style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
              Shadow(color: Colors.red, offset: Offset(2, 2), blurRadius: 1)
            ]),
          )),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 12,
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0.0),
                            child:
                                SignInButton(Buttons.GoogleDark, onPressed: () {
                              signInWithGoogle().whenComplete(() {
                                setState(() {
                                  _isloading = false;
                                });
                              }).then((value) {
                                if (value != null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePage(value)));
                                }
                              });
                            }),
                          ),
                          Divider(
                            height: 25,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 12,
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 10.0),
                              child:
                                  SignInButton(Buttons.Facebook, onPressed: () {
                                signInWithFacebook().whenComplete(() {
                                  setState(() {
                                    _isloading = false;
                                  });
                                }).then((value) {
                                  if (value != null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage(value)));
                                  }
                                });
                              })),
                          _isloading
                              ? new Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                  color: Colors.transparent,
                                  child: new CircularProgressIndicator(
                                    backgroundColor: Colors.pinkAccent,
                                  ))
                              : new Container()
                        ],
                      ))),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.teal[300],
                    width: 6,
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/mlogo1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> signInWithGoogle() async {
    setState(() {
      _isloading = true;
    });

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

  Future<User> signInWithFacebook() async {
    setState(() {
      _isloading = true;
    });

    // Trigger the sign-in flow
    var fbinstanse = FacebookAuth.instance;

    

    final LoginResult result = await fbinstanse.login();

    // Create a credential from the access token
    if (result.accessToken != null) {
      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken.token);

      // Once signed in, return the UserCredential
      final UserCredential authResult = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final User user = authResult.user;
      return user;
    }
  }
//Facebook
  // final FacebookLogin fbLogin = new FacebookLogin();
  // Future<User> facebookLogin(BuildContext context) async {
  //   User currentUser;
  //   setState(() {
  //     _isloading = true;
  //   });
  //   //fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  //   // if you remove above comment then facebook login will take username and pasword for login in Webview

  //   final FacebookLoginResult facebookLoginResult =
  //       await fbLogin.logIn(['email', 'public_profile']);
  //   if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
  //     FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
  //     final AuthCredential credential =
  //         FacebookAuthProvider.credential(facebookAccessToken.token);
  //     final UserCredential authResult =
  //         await _auth.signInWithCredential(credential);
  //     final User user = authResult.user;

  //     assert(user.email != null);
  //     assert(user.displayName != null);
  //     assert(!user.isAnonymous);
  //     assert(await user.getIdToken() != null);

  //     final User currentUser = _auth.currentUser;
  //     assert(user.uid == currentUser.uid);
  //     return currentUser;
  //   }
  // }

  //Google Method

  showLoaderDialog() {
    BuildContext context;
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
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
}
